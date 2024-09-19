#  main.py
''' --------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Wang Tei.
 >> University of Illinois at Chicago - CS 415, Fall 2024
 >> --------------------------------------------------------------------------------------
 >> File   :: main.py
 >> Course :: CS 415 (42844), FA24
 >> Author :: Ryan Magdaleno (rmagd2)
 >> System :: Windows 10 w/ Python 3.11.3
 - -                             - -
 >> File overview ::
 >> This program implements convolution and is able to apply multiple filters onto
 >> images. This program makes heavy use of cv2 and numpy to achieve this goal.
 >> There are multiple filters to use, including a custom kernel you can modify.
 >> You can mix and match filters, along with using cv2's filter2D function instead
 >> of this program's implementation (cv2 is way faster). The mean filter can't be
 >> used by cv2's filter2D function.
 - -                             - -
 >> Usage:
 >> ret = convolution("lena.png", 3, ["cv2", "mean", "median"])
 >> cv2 must be in the 0th index if you want to use that, you can use other filters
 >> in combination after index 0.
 >> Meaning: Apply 7x7 mean and median filters onto "lena.png" using cv2.filter2D.
 >>
 >> ret = convolution("art.png", 3, ["mean", "median"])
 >> Meaning: Apply 3x3 mean and median filters onto "art.png" using apply_filter.
-------------------------------------------------------------------------------------- '''
# Module Imports ::
from typing import Optional, List
from os import path as opath
import numpy as np
import cv2 as cv

# Mean kernel is all ones divided by k_size^2 :: - -                                   - -
def mean_kernel(k_size: int) -> np.ndarray:
    return np.ones((k_size, k_size), dtype=np.float32) / (k_size * k_size)

# Use np.fromfunction to apply a 2D gaussian function on each (x,y) pos.
# G(x, y)  = 1/( 2πσ^2 ) * exp( -( ( x-u_x )^2 + ( y-u_y )^2 ) / 2σ^2 )
# σ        = std, in this case always 1.0
# u_x, u_y = center of kernel: (k_size - 1) / 2
# I(Ryan), personally used this link to help make this implementation:
# http://www.devanddep.com/tutorial/numpy/how-to-generate-2-d-gaussian-array-using-numpy.html
def gaussian_kernel(k_size: int, std: float=1.0) -> np.ndarray:
    ret = np.fromfunction(
        lambda x, y:
            (1 / (2 * np.pi * std ** 2))
            * np.exp(
                -((x - (k_size - 1) / 2) ** 2 + (y - (k_size - 1) / 2) ** 2)
                / (2 * std ** 2)
            ),
        (k_size, k_size)
    )
    return ret / np.sum(ret) # Normalized

# The sharpen kernel emphasizes differences in adjacent pixel values  :: - -           - -
def sharpening_kernel(k_size: int) -> np.ndarray:
    ret = None
    if k_size == 3:
        ret = np.array([
            [ 0, -1,  0],
            [-1,  5, -1],
            [ 0, -1,  0]
        ], dtype=np.float32)
    elif k_size == 5:
        ret = np.array([
            [ 0,  0, -1,  0,  0],
            [ 0, -1, -1, -1,  0],
            [-1, -1, 13, -1, -1],
            [ 0, -1, -1, -1,  0],
            [ 0,  0, -1,  0,  0]
        ], dtype=np.float32)
    elif k_size == 7:
        ret = np.array([
            [ 0,  0,  0, -1,  0,  0,  0],
            [ 0,  0, -1, -1, -1,  0,  0],
            [ 0, -1, -1, -1, -1, -1,  0],
            [-1, -1, -1, 21, -1, -1, -1],
            [ 0, -1, -1, -1, -1, -1,  0],
            [ 0,  0, -1, -1, -1,  0,  0],
            [ 0,  0,  0, -1,  0,  0,  0]
        ], dtype=np.float32)
    elif k_size == 9:
        ret = np.array([
            [ 0,  0,  0,  0, -1,  0,  0,  0,  0],
            [ 0,  0,  0, -1, -1, -1,  0,  0,  0],
            [ 0,  0, -1, -1, -1, -1, -1,  0,  0],
            [ 0, -1, -1, -1, -1, -1, -1, -1,  0],
            [-1, -1, -1, -1,  35, -1, -1, -1, -1],
            [ 0, -1, -1, -1, -1, -1, -1, -1,  0],
            [ 0,  0, -1, -1, -1, -1, -1,  0,  0],
            [ 0,  0,  0, -1, -1, -1,  0,  0,  0],
            [ 0,  0,  0,  0, -1,  0,  0,  0,  0]
        ], dtype=np.float32)
    return ret / np.sum(ret) # Normalized

# Custom kernel, make sure to match k_size passed in convolution function :: - -       - -
def custom_kernel(k_size: int) -> np.ndarray:
    ret = np.array([
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
    ])
    if ret.shape[0] != k_size or ret.shape[1] != k_size:
        exit(" > Custom kernel shape is not k_size * k_size")
    return ret

# Padding utility function :: - -                                                      - -
def pad_image(img: np.ndarray, pad_amount: int) -> np.ndarray:
    return np.pad(
        img,
        (
            (pad_amount, pad_amount),
            (pad_amount, pad_amount),
            (0, 0)
        )
    )

# Median implementation using np.sort and np.ndarray.flatten :: - -                    - -
def median(region: np.ndarray) -> float:
    sorted_region = np.sort(region.flatten())
    n = len(sorted_region)
    if n & 0x1:
        return sorted_region[n // 2]
    return (sorted_region[n // 2 - 1] + sorted_region[n // 2]) / 2

# Similar to apply_filter, but uses median function here instead :: - -                - -
def median_filter(img: np.ndarray, k_size: int) -> np.ndarray:
    img_height, img_width, img_channels = img.shape
    output = np.zeros_like(img, dtype=np.float32)
    img = pad_image(img, pad_amount=k_size // 2)

    for i in range(img_height):
        for j in range(img_width):
            region = img[i:i+k_size, j:j+k_size]
            for c in range(img_channels):
                output[i, j, c] = median(region[:, :, c])

    return output

# Apply given kernel onto image via convolution :: - -                                 - -
def apply_filter(
    img: np.ndarray,
    kernel: np.ndarray,
    k_size: int,
    use_cv: bool) -> np.ndarray:

    if use_cv:
        return cv.filter2D(img, -1, kernel.astype(np.float32))

    img_height, img_width, img_channels = img.shape
    output = np.zeros_like(img, dtype=np.float32)
    img = pad_image(img, k_size // 2)

    for i in range(img_height):
        for j in range(img_width):
            region = img[i:i+k_size, j:j+k_size]
            for c in range(img_channels):
                output[i, j, c] = np.sum(region[:, :, c] * kernel)

    return output

# Load kernel / image and apply a filter onto the image via convolution :: - -         - -
def convolution(input_name: str, k_size: int, filters: List[str]) -> Optional[str]:
    img = cv.imread(input_name, cv.IMREAD_COLOR)
    if img is None:
        return f"Image load error (cv2): \"{input_name}\""

    if k_size < 3 or k_size > 9:
        return f"Kernel size must be 3, 5, 7, or 9: {k_size}"

    if not k_size & 0x1:
        return f"Even kernel size: {k_size}"

    use_cv = False
    if filters and filters[0] == "cv2":
        print(" > Using cv2 filter2D.")
        filters = filters[1:]
        use_cv = True

    if filters is None:
        return "Add some filter strings"

    kernels = {
        "mean": mean_kernel,
        "custom": custom_kernel,
        "gaussian": gaussian_kernel,
        "sharpening": sharpening_kernel
    }
    for filter_str in filters:
        if filter_str == "median":
            img = median_filter(img, k_size)
        elif filter_str in kernels:
            img = apply_filter(img, np.flip(kernels[filter_str](k_size)), k_size, use_cv)
        else:
            return f"Invalid kernel filter string passed: {filter_str}"
        print(f" > {k_size}x{k_size} {filter_str} filter done.")

    if use_cv:
        filters.insert(0, "cv2")
    ext = opath.splitext(input_name)
    cv.imwrite(f"{ext[0]}_{k_size}x{k_size}_{'-'.join(filters)}{ext[1]}", img)
    return None

# Program entrypoint :: - -                                                            - -
if __name__ == "__main__":
    ret_str = convolution("lena.png", k_size=3, filters=["cv2", "mean", "gaussian"])
    if ret_str:
        print(f" > {ret_str}")
