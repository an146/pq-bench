.PHONY: all clean
all : c-heap ocaml-heap
	@./test.sh

clean:
	rm -Rf c-heap ocaml-heap *.{cmi,cmx,o}

c-heap: heap.c
	gcc -O2 --std=c99 -o $@ $^

ocaml-heap: heap.ml
	ocamlfind ocamlopt -package base -linkpkg -o $@ $^
