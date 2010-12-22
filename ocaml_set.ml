open Printf
open Sys

module IntSet = Set.Make (struct
   type t = int
   let compare = compare
end)

let main () =
   if Array.length argv < 3 then
      failwith (sprintf "usage: %s size count" argv.(0));
      let size = int_of_string argv.(1)
      and count = int_of_string argv.(2) in
      let set = ref IntSet.empty in
      Random.init 0;
      let process_elt () =
         set := IntSet.remove (IntSet.min_elt !set) !set
      in
      for i = 1 to count do
         set := IntSet.add (Random.int 100) !set;
         if IntSet.cardinal !set = size then
            process_elt ()
      done;
      while not (IntSet.is_empty !set) do
         process_elt ()
      done

let _ = main()

(* vim: set ts=3 sw=3 tw=80 : *)
