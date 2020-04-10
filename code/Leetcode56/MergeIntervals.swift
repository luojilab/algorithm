var tmp: [[Int]] = []

tmp.append([1, 5])
tmp.append([9, 10])
tmp.append([6, 8])
tmp.append([2, 3])
tmp.append([1, 4])

func merge(_ intervals: [[Int]]) -> [[Int]] {
	if intervals.count < 2 {
		return intervals
	}
	var result = intervals
	var i = 0
	while i < result.endIndex {
		var j = i + 1
		var needNext = true
		while j < result.endIndex {
			let array = result[i]
			let temp = result[j]
			if max(array[0], temp[0]) <= min(array[1], temp[1]) {
				result.remove(at:j)
				let a = [min(array[0],temp[0]),max(array[1], temp[1])]
				result[i] = a
				needNext = false
			} else {
				j += 1
			}
		}
		if needNext {
			i += 1
		}
	}
	return result
}

struct Node {
	var start: Int
	var end: Int
	init(start: Int, end: Int) {
		self.start = min(start, end)
		self.end = max(start, end)
	}
	static func < (node1: Node, node2: Node) -> Bool {
		return node1.start < node2.start
	}
	
	static func == (node1: Node, node2: Node) -> Bool {
		return node1.start < node2.start && node1.end == node2.end
	}
}

func mergeIntervals(array: [Node]) -> [Node] {
	if array.count < 2 {
		return array
	}
	var list = array
	var arrayM: [Node] = []
	list.sort { return $0 < $1}
	
	var idx = 0
	let endIndex = list.endIndex - 1;
	while idx <= endIndex {
		let left = list[idx].start
		var right = list[idx].end
		while idx < endIndex, right >= list[idx + 1].start {
			idx += 1
			right = max(right, list[idx].end)
		}
		arrayM.append(Node(start: left, end: right))
		idx += 1
	}
	
	return arrayM
}


func insert(intervals : [Node], newInterval: Node) -> [Node] {
	if intervals.isEmpty {
		return [newInterval]
	}
	var l: [Node] = []
	var r: [Node] = []

	var start = newInterval.start
	var end   = newInterval.end

	for interval in intervals {
		if interval.end < start {
			l.append(interval)
		} else if interval.start > end {
			r.append(interval)
		} else {
			start = min(interval.start, start)
			end   = max(interval.end, end)
		}
	}
	return l + [Node(start: start, end: end)] + r
}

func deleteNode(array: [Node],delete:Node) -> [Node] {
	if array.count == 0 || delete.end < array.first!.start {
			return array
	}
	var list: [Node] = []
	for node in array {
		if node.end <= delete.start || node.start >= delete.end {
				list.append(node)
		} else {
			if node.start < delete.start {
				list.append(Node(start: node.start, end: delete.start))
			}
			if node.end > delete.end {
				list.append(Node(start: delete.end, end: node.end))
			}
		}
	}
	return list
}

func mergeDemo1() {
	print(merge(tmp))
	for node in merge(tmp) {
		print(node)
	}	
}

var tmpNodes: [Node] = [Node(start:1, end:5), Node(start:9, end:10), Node(start:6, end:8), Node(start:2, end:3), Node(start:1, end:4)]
func mergeDemo2() {
	print(tmpNodes)
	for node in mergeIntervals(array:tmpNodes) {
		print("[\(node.start), \(node.end)]")
	}	
}

func insetDemo() {
	let insetDemoNodes =  mergeIntervals(array:tmpNodes)
	print(insetDemoNodes)
	for node in insert(intervals: insetDemoNodes, newInterval: Node(start: 0, end: 3)) {
		print("[\(node.start), \(node.end)]")
	}	
}

func deleteDemo() {
	let insetDemoNodes =  mergeIntervals(array:tmpNodes)
	print(insetDemoNodes)
	for node in deleteNode(array: insetDemoNodes, delete: Node(start: 3, end: 7)) {
		print("[\(node.start), \(node.end)]")
	}
}

deleteDemo()





