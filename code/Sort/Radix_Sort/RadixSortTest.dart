void main() {
  List<int> originalList = [35, 15, 7, 28, 92, 60, 17, 31];
  
  List<int> sortedList = radixSort(originalList);
  
  for (int i = 0; i < originalList.length; i++) {
    print('original ${originalList[i]}');
  }
  for (int i = 0; i < sortedList.length; i++) {
    print('sorted ${sortedList[i]}');
  }
}

List<int> radixSort(List<int> list) {
  List<int> resultList = list;

  int max = list[0]; //最大值，算出数组位数
  for (int i = 1; i < list.length; i++) {
    if (max < list[i]) {
      max = list[i];
    }
  }
  for (int exp = 1; max / exp > 0; exp *= 10) {
    resultList = countSort(resultList, exp);
  }
  return resultList;
}

List<int> countSort(List<int> list, int exp) {
  List<int> resultList = new List(list.length);

  List<int> countList = new List.filled(10, 0);

  for (int i = 0; i < list.length; i++) {
    countList[((list[i] / exp) % 10).toInt()]++;
  }
  for (int i = 1; i < countList.length; i++) {
    countList[i] += countList[i - 1];
  }
  for (int i = list.length - 1; i >= 0; i--) {
    resultList[countList[((list[i] / exp) % 10).toInt()] - 1] = list[i];
    countList[((list[i] / exp) % 10).toInt()]--;
  }

  return resultList;
}

