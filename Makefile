TESTS=c_heap ocaml_heap ocaml_set
.PHONY: all clean
all : ${TESTS}
	@./test.sh

clean:
	rm -Rf ${TESTS} *.{cmi,cmx,o}

c_heap: c_heap.c
	gcc -O2 --std=c99 -o $@ $^

ocaml_heap: ocaml_heap.ml
	ocamlfind ocamlopt -o $@ $^

ocaml_set: ocaml_set.ml
	ocamlfind ocamlopt -o $@ $^
