#include <unordered_map>

int getClimbingWaysRecursive(int n) {
	if (n < 1) {
		return 0;
	}

	if (n == 1) {
		return 1;
	}

	if (n == 2) {
		return 2;
	}

	return getClimbingWaysRecursive(n - 1) + getClimbingWaysRecursive(n - 2);
}

int getClimbingWaysMemo(int n, std::unordered_map<int, int> &map) {
	if (n < 1) {
		return 0;
	}

	if (n == 1) {
		return 1;
	}

	if (n == 2) {
		return 2;
	}

	std::unordered_map<int, int>::iterator iter = map.find(n);
	if (iter != map.end()) {
		return iter->second;
	}else {
		int value = getClimbingWaysMemo(n - 1, map) + getClimbingWaysMemo(n - 2, map);
		map[n] = value;
		return value;
	}
}

int getClimbingWaysDynamic(int n) {
	if (n < 1) {
		return 0;
	}

	if (n == 1) {
		return 1;
	}

	if (n == 2) {
		return 2;
	}

	int a = 1;
	int b = 2;
	int temp = 0;
	for (int i = 3; i <= n; i++) {
		temp = a + b;
		a = b;
		b = temp;
	}
	return temp;
}