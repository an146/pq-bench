#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

int *heap = NULL;
int heap_size = 0;
int heap_cursize = 0;

void
heap_swap(int i, int j)
{
	int tmp = heap[i];
	heap[i] = heap[j];
	heap[j] = tmp;
}

void
heap_init(int size)
{
	heap = malloc(size * sizeof(int));
	heap_size = size;
}

void
heap_push(int x)
{
	assert(heap_cursize < heap_size);

	//printf("push: %i\n", x);
	int i = heap_cursize;
	heap[heap_cursize++] = x;
	while (i > 0) {
		int parent = (i - 1) / 2;
		if (heap[parent] < heap[i])
			return;

		heap_swap(i, parent);
		i = parent;
	}
}

int
heap_pop()
{
	assert(heap_cursize > 0);

	int ret = heap[0];
	heap[0] = heap[--heap_cursize];
	int i = 0;
	while (1) {
		int j;
		int j1 = i * 2 + 1;
		int j2 = i * 2 + 2;
		if (j1 >= heap_cursize)
			break;
		else if (j2 >= heap_cursize)
			j = j1;
		else
			j = heap[j1] < heap[j2] ? j1 : j2;

		if (heap[i] < heap[j])
			break;

		heap_swap(i, j);
		i = j;
	}
	//printf("pop: %i\n", ret);
	return ret;
}

void
process_elt()
{
	int x = heap_pop();
	(void)x;
}

int
main(int argc, char **argv)
{
	if (argc < 3) {
		fprintf(stderr, "usage: %s size count\n", argv[0]);
		exit(1);
	}

	int size = atoi(argv[1]);
	int count = atoi(argv[2]);
	heap_init(size);

	srand(0);
	for (int i = 0; i < count; i++) {
		heap_push(rand() % 100);
		if (heap_cursize == size)
			process_elt();
	}
	while (heap_cursize > 0)
		process_elt();
}
