#include <stdlib.h>
#include "LRUCache.h"

int main(int argc, char **argv) {

	domain_algorithm_share::LRUCache<int, int> lruCache(2);
	int key1, key2, key3, key4;
	lruCache.Put(1, 1);
	lruCache.Put(2, 2);
	key1 = lruCache.Get(1);
	printf("key1:%d\n", key1);

	lruCache.Put(3, 3);
	
	key2 = lruCache.Get(2);
	printf("key2:%d\n", key2);

	lruCache.Put(4, 4);

	key1 = lruCache.Get(1);
	printf("key1:%d\n", key1);
	key3 = lruCache.Get(3);
	printf("key3:%d\n", key3);
	key4 = lruCache.Get(4);
	printf("key4:%d\n", key4);

	return 0;
}