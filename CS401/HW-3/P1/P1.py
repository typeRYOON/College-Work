import matplotlib.pyplot as plt

data = []
with open("a.txt", 'r') as f:
    for line in f:
        temp = line.strip().split()
        data.append((int(temp[0]), int(temp[1]), int(temp[2])))

with open("b.txt", 'r') as f:
    for line in f:
        temp = line.strip().split()
        data.append((int(temp[0]), int(temp[1]), int(temp[2])))


# Extracting individual lists for plotting
n_values = [entry[0] for entry in data]
nlogn_values = [entry[1] for entry in data]
nsquared_values = [entry[2] for entry in data]

# Plotting
plt.plot(n_values, nlogn_values, label='nlogn')
plt.plot(n_values, nsquared_values, label='nsquared')

# Adding labels and legend
plt.xlabel('n')
plt.ylabel('Operations')
plt.title('Comparison of nlogn and nsquared Implementations')
plt.legend()

# Display the plot
plt.grid(True)
plt.show()