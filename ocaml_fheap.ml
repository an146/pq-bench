open Batteries
open Printf
open Sys

let main () =
   if Array.length argv < 3 then
      failwith (sprintf "usage: %s size count" argv.(0));
      let size = int_of_string argv.(1)
      and count = int_of_string argv.(2) in
      let heap = ref Heap.empty in
      Random.init 0;
      let process_elt () =
         heap := Heap.del_min !heap
      in
      for i = 1 to count do
         heap := Heap.insert (Random.int 100) !heap;
         if Heap.size !heap = size then
            process_elt ()
      done;
      while Heap.size !heap > 0 do
         process_elt ()
      done

let _ = main ()

(* vim: set ts=3 sw=3 tw=80 : *)
