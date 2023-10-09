(* main.fs *)
(* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : main.fs :: HW-2
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno, rmagd2
 >> System : .NET 7.0 w/ Windows 10
 >> UIN    : 668523658
 - -                            - -
 >> F# exercise overview:
 >> F# program to input a string and print out information about the # of top 10 letters
 >> in that string and substituting certain words.
--------------------------------------------------------------------------------------- *)

(* Func :: explode: - -                                                                - -
Given a string s, explodes the string into a list of characters.
Example: explode "apple" => ['a';'p';'p';'l';'e']
    - -                                                                                - -
    @param S    : A string to be returned as a List of chars.
    @return List: A List of chars representing S.                                       *)
let explode (S : string) =

    List.ofArray (S.ToCharArray())

(* Func :: implode: - -                                                                - -
The opposite of explode --- given a list of characters, returns the list as a string.
Example: implode ['t';'h';'e'] => "the"
    - -                                                                                - -
    @param L      : A List of chars representing S.
    @return string: A string representing L.                                            *)
let implode (L : char list) =

    new string(List.toArray L)

(* Func :: length: - -                                                                 - -
Returns the length of the input char list.
    - -                                                                                - -
    @param L   : A List of chars representing S.
    @return int: The amount of chars in L.                                              *)
let rec length (L : char list) =

    match L with
    | [] -> 0  // Base case.
    | head::tail -> 1 + length tail

(* Func :: topTenAmount: - -                                                           - -
Returns # of top 10 letters of the English alphabet in the string.
    - -                                                                                - -
    @param L   : A List of chars representing S.
    @return int: *)
let rec topTenAmount L =

    match L with
    | [] -> 0                           // Base case.
    | head::tail ->
        let topTenChar =
            match head with
            | 'e' | 't' | 'a' | 'o' | 'i' | 'n' | 's' | 'r' | 'h' | 'l' -> 1
            | _ -> 0
        topTenChar + topTenAmount tail  // Propagation.

(* Func :: getCharCount: - -                                                           - -
Counts the occurences of target char within L char List.
    - -                                                                                - -
    @param L     : A List of chars representing S.
    @param target: A char, one of the top ten chars.
    @return int  : Recursively returns the # of target chars within L.                  *)
let rec getCharCount (L : char list, target : char) =

    match L with
        | [] -> 0                                                   // Base case.
        | head::tail ->
            match head with
            | x when x = target -> 1 + getCharCount (tail, target)  // Propagation.
            | _ -> getCharCount (tail, target)                      // Propagation.

(* Func :: subWords: - -                                                               - -
Substitute substrings "the", "boy", "rat" -> "her", "man", "hat" respectively within
input L List.
    - -                                                                                - -
    @param L    : A List of chars representing S.
    @return List: The modified L list, with sub-strings modified if they exist.         *)
let rec subWords (L : char list) =

    match L with    // Propagate based on sub-string[0:3]:
        | 't'::'h'::'e'::tail -> 'h'::'e'::'r'::subWords tail  // the -> her.
        | 'b'::'o'::'y'::tail -> 'm'::'a'::'n'::subWords tail  // boy -> man.
        | 'r'::'a'::'t'::tail -> 'h'::'a'::'t'::subWords tail  // rat -> hat.
        | nonMatchChr::tail -> nonMatchChr::subWords tail      // Prepend non-match char.
        | [] -> []  // Base case.

(* Func :: main: - -                                                                   - -
Main function where the previously defined functions are used to execute the purpose.
    - -                                                                                - -
    @param argv: A string array representing any command line arguments.
    @return int: 0, good execution.                                                     *)
[<EntryPoint>]
let main (argv : string array) =

    printf "Starting\n\ninput> "
    
    // Exploded string:
    let L = explode (System.Console.ReadLine())
    printfn "exploded: %A" L

    // Length of input:
    printf "\nlength of sentence: %A" (length L)

    // # of top ten chars in input:
    printfn "\n# of top 10 letters: %A" (topTenAmount L)

    // Use a print function to iterate through topTen char list:
    let printCharCount (chr : char) =
        printfn "'%c': %d" chr (getCharCount (L, chr))
    List.iter printCharCount ['a'; 'e'; 'h'; 'i'; 'l'; 'o'; 'n'; 'r'; 's'; 't']

    // Imploded string:
    printfn "\nimploded: %A\n" (implode L)

    // Substitute a possible sub-words and implode:
    let L = subWords L
    printfn "swap imploded: %A\n\nDone" (implode L)

    0