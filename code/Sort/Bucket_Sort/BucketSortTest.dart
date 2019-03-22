void main() {
  List<int> originalList = [32, 15, 9, 23, 7, 45, 11, 5, 38, 27, 49, 47, 35, 12];
  
  List<int> sortedList = bucketSort(originalList);
  
  for (int i = 0; i < originalList.length; i++) {
    print('original ${originalList[i]}');
  }
  for (int i = 0; i < sortedList.length; i++) {
    print('sorted ${sortedList[i]}');
  }
}

List<int> bucketSort(List list) {
  List<int> resultList = new List(list.length);

  int max = list[0]; //最大值，算出数组位数
  for (int i = 0; i < list.length; i++) {
    if (max < list[i]) {
      max = list[i];
    }
  }
  List bucketList = new List.filled(max + 1, 0);

  for (int i = 0; i < list.length; i++) {
    bucketList[list[i]]++;
  }

  int outPos = 0;
  for (int i = 0; i < bucketList.length; i++) {
    for (int j = 0; j < bucketList[i]; j++) {
      resultList[outPos++] = i;
    }
  }

  return resultList;
}

