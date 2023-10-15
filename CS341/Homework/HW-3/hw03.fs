(* hw03.fs *)
(* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : hw03.fs :: HW-3
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno, rmagd2
 >> System : .NET 7.0 w/ Windows 10
 >> UIN    : 668523658
 - -                            - -
 >> F# exercise overview:
 >> Various functions fo_r practicing F#.
--------------------------------------------------------------------------------------- *)
namespace homework

module hw03 =
    (* Func :: contains: - -                                              EXERCISE #01 - -
    Returns true if element e is within given list L.
    [ Upper-bound N, N = L len ]
        - -                                                                            - -
        @param e    : An element of type Any.
        @param L    : A list of type Any.
        @return bool: T/F based on if e is within list L.                               *)
    let rec contains (e, L) =

        match L with
            | [] -> false  // Fully recursed, return false, no match.
            | chr::tail ->
                if chr = e then true
                else contains (e, tail)


    (* Func :: subset: - -                                                EXERCISE #01 - -
    Returns true if S is a subset of L, false if not.
        [ Upper-bound M * N run-time, M = S len, N = L len ]
        - -                                                                            - -
        @param S    : A list of type Any.
        @param L    : A list of type Any.
        @return bool: T/F based on if all elements of S are contained within L.         *)
    let rec subset S L =

        match S with
            | [] -> true
            | chr::tail ->
                if contains (chr, L) then subset tail L
                else false
            (* If the first char of S exists within L, subset (S[1:], L) recurse until
               S is empty, indicating that all chars of S are within L.                 *)


    (* Func :: del: - -                                                   EXERCISE #02 - -
    Deletes all occurrences of e from the list L, returning the new list.
    This version is written recursively, this is the tail-recursive helper function.
        [ Upper-bound N, N = L len ]
        - -                                                                            - -
        @param newL : A list to be contructed where it's L - e.
        @param e    : An element of type Any.
        @param L    : A list of type Any.
        @return List: newL, returns the constructed list.                               *)
    let rec del (newL, e, L) =

        match L with
            | [] -> newL                              // Base case, L list is traversed.
            | head::tail ->
                if head = e then del (newL, e, tail)  // Do not add element to newL.
                else del (head::newL, e, tail)        // Prepend element to keep.


    (* Func :: delete_tr: - -                                             EXERCISE #02 - -
    Deletes all occurrences of e from the list L, returning the new list.
    This is the API function fo_r the tail-recursive helper function.
        [ Upper-bound N, N = L len ]
        - -                                                                            - -
        @param e    : An element of type Any.
        @param L    : A list of type Any.
        @return List: A new list where all instances of e are removed from L.           *)
    let delete_tr e L =

        List.rev (del ([], e, L))  // Elements are in reverse, return correct order.


    (* Func :: delete_ho: - -                                             EXERCISE #03 - -
    Deletes all occurrences of e from the list L, returning the new list.
        [Upper-bound N, N = L len ]
        - -                                                                            - -
        @param e    : An element of type Any.
        @param L    : A list of type Any.
        @return List: A new list where all instances of e are removed from L.           *)
    let delete_ho e L =

        L |> List.filter (fun ele -> ele <> e)
        (* Pipe list L into List.filter, using a lambda, input ele parameter, check if
           ele <> e (ele does not equal e).                                             *)


    (* Func :: examAverages: - -                                          EXERCISE #04 - -
    Given a list of tuples of the form ("netid", [score;score;score;...]), computes each
    netid's average score as a real number and returns a list of tuples of the form
    ("netid", average).
        [ Upper-bound N, N = LT len ]
        - -                                                                            - -
        @param LT   : A list of type of tuples of form (int, [int,...]).
        @return List: A list of tuples of the form (int, float)                         *)
    let rec examAverages LT =

        match LT with
            | [] -> []
            | (id, scores)::tail ->
                (id, scores |> List.map float |> List.average)::examAverages tail
                (* Convert score ints into floats, then pipe that result into List.avg.
                Prepend to an empty list (initially) and construct a new list of tuples.*)


    (* Func :: pairwise: - -                                              EXERCISE #05 - -
    Given 2 lists L1 and L2, both the same length, merges the corresponding elements
    into pairs, returning a list of pairs.
        [ Upper-bound N, N = L1 len = L2 len ]
        - -                                                                            - -
        @param L1   : A list of type Any.
        @param L2   : A list of type Any.
        @return List: A list of tuples of the form (Any, Any).                          *)
    let rec pairwise L1 L2 =

        match L1, L2 with
            | [], [] -> []  // Base case, iterated entirely, return list for prepending.
            | headL1::tailL1, headL2::tailL2 ->
                (headL1, headL2)::pairwise tailL1 tailL2     // Prepend pair to new list.
            | _ -> []       // Not possible because L1/L2 are same len, for comp warning.
