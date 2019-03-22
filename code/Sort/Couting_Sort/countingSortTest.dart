void main() {
  List<int> originalList = [7, 3, 5, 2, 7, 4, 5, 8];
  
  List<int> sortedList = countingSort(originalList);
  
  for (int i = 0; i < originalList.length; i++) {
    print('original ${originalList[i]}');
  }
  for (int i = 0; i < sortedList.length; i++) {
    print('sorted ${sortedList[i]}');
  }
}

List<int> countingSort(List<int> list) {
  int max = list[0]; //最大值，优化数组上限
  int min = list[0]; //最小值，优化数组下限
  for (int i = 0; i < list.length; i++) {
    if (max < list[i]) {
      max = list[i];
    }
    if (min > list[i]) {
      min = list[i];
    }
  }

  int range = max - min + 1;
  List<int> countList = new List.filled(range,0); //计数数组
  List<int> resultList = new List(list.length); //结果数组

  for (int i = 0; i < list.length; i++) {
    countList[list[i] - min]++;
  }
  for (int i = 1; i < countList.length; i++) {
    countList[i] += countList[i - 1];
  }
  for (int i = list.length - 1; i >= 0; i--) {
    resultList[countList[list[i] - min] - 1] = list[i];
    countList[list[i] - min]--;
  }
  return resultList;
}

