#!/bin/bash

do_test ()
{
	echo $1
	eval $1
}

echo === heap sort ===
do_test "time ./c_heap 2000000 2000000"
do_test "time ./ocaml_heap 2000000 2000000"
do_test "time ./ocaml_set 2000000 2000000"
do_test "time ./ocaml_fheap 2000000 2000000"
echo === priority queue ===
do_test "time ./c_heap 100 2000000"
do_test "time ./ocaml_heap 100 2000000"
do_test "time ./ocaml_set 100 2000000"
do_test "time ./ocaml_fheap 100 2000000"
