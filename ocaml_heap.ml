open Printf
open Sys

type heap_t = {
   heap : int array;
   mutable size : int;
}

let heap_create size = { heap = Array.make size 0; size = 0; }

let heap_swap {heap} i j =
   let tmp = heap.(i) in
   heap.(i) <- heap.(j);
   heap.(j) <- tmp

let heap_push h x =
   let heap = h.heap and size = h.size in
   assert (size < Array.length heap);
   heap.(size) <- x;
   let par i = (i - 1) / 2 in
   let rec fix_heap = function
      | i when heap.(i) < heap.(par i) ->
            heap_swap h i (par i);
            fix_heap (par i)
      | _ -> ()
   in fix_heap size;
   h.size <- (size + 1)

let heap_pop h =
   let heap = h.heap and size = h.size in
   assert (size > 0);
   let ret = heap.(0) in
   heap.(0) <- heap.(size - 1);
   let size = size - 1 in
   h.size <- size;
   let rec fix_heap i =
      let childs = i * 2 + 1 in
      if childs >= size then
         ()
      else (
         let c =
            if childs + 1 >= size then
               childs
            else if heap.(childs) < heap.(childs + 1) then
               childs
            else
               childs + 1
         in
         if heap.(i) < heap.(c) then
            ()
         else (
            heap_swap h i c;
            fix_heap c
         )
      )
   in fix_heap 0;
   (* Printf.printf "pop: %i\n" ret; *)
   ret

let main () =
   if Array.length argv < 3 then
      failwith (sprintf "usage: %s size count" argv.(0));
   let size = int_of_string argv.(1)
   and count = int_of_string argv.(2) in
   let heap = heap_create size in
   Random.init 0;
   let process_elt () =
      ignore (heap_pop heap)
   in
   for i = 1 to count do
      heap_push heap (Random.int 100);
      if heap.size = size then
         process_elt ()
   done;
   while heap.size > 0 do
      process_elt ()
   done

let _ = main()

(* vim: set ts=3 sw=3 tw=80 : *)
