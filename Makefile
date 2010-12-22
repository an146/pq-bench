.PHONY: all clean
all : c_heap ocaml_heap
	@./test.sh

clean:
	rm -Rf c_heap ocaml_heap *.{cmi,cmx,o}

c_heap: c_heap.c
	gcc -O2 --std=c99 -o $@ $^

ocaml_heap: ocaml_heap.ml
	ocamlfind ocamlopt -o $@ $^
