do_test ()
{
	echo $1
	eval $1
}

echo === heap sort ===
do_test "time ./c_heap 4000000 4000000"
do_test "time ./ocaml_heap 4000000 4000000"
do_test "time ./ocaml_set 4000000 4000000"
echo === priority queue ===
do_test "time ./c_heap 100 4000000"
do_test "time ./ocaml_heap 100 4000000"
do_test "time ./ocaml_set 100 4000000"
