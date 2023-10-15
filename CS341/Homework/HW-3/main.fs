(* main.fs *)
(* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : main.fs :: HW-3
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno, rmagd2
 >> System : .NET 7.0 w/ Windows 10
 >> UIN    : 668523658
 - -                            - -
 >> F# exercise overview:
 >> Various functions fo_r practicing F#.
 >> Main program for testing HW #03 functions.
--------------------------------------------------------------------------------------- *)
open homework
open System

[<EntryPoint>]
let main argv =
   printfn "** Starting **"
   printfn ""
   //
   let L1 = [1; 2; 3]
   let L2 = [1..5]
   let L3 = ["dog"; "catt"; "weird"]
   let L4 = [("sdeitz2",[100;90;91]); ("psankar",[100;100;100;100;98])]
   let L5 = [1;3;5;7]
   let L6 = [10;20;30;40]
   
   printfn "L1: %A" L1
   printfn "L2: %A" L2
   printfn "L3: %A" L3
   printfn "L4: %A" L4
   printfn "L5: %A" L5
   printfn "L6: %A\n" L6
   printfn "Subset(L1, L2): %A" (hw03.subset L1 L2)
   printfn "delete_tr (\"catt\", L1): %A" (hw03.delete_tr "catt" L3)
   printfn "delete_ho (\"weird\", L1): %A" (hw03.delete_ho "weird" L3)
   printfn "examAverages (L3): %A" (hw03.examAverages L4)
   printfn "pairwise (L5, L6): %A\n" (hw03.pairwise L5 L6)
   printfn "** Done **"
   0