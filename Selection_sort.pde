class Selection extends Sorter { 
  int[] _sort(int[] arr) {
    int start_index = 0;
    int min = 999999999;
    int min_index = -1;
    do {
      min = 999999999;
      min_index = -1;
      for(int i = start_index; i < arr.length; i++) {
        DBG.append(i);
        if (arr[i] < min) {
          min = arr[i];
          min_index = i;
        }
        DBG.remove(DBG.size()-1);
      }
      DBG.append(start_index);
      int h = arr[start_index];
      arr[start_index] = arr[min_index];
      arr[min_index] = h;
      start_index++;
    } while(start_index < arr.length);
    DBG.clear();
    delay(100);
    return arr;
  }
}

//################################################
//################################################
//#################################################

class Bubble extends Sorter {
  int[] _sort(int[] arr) {
    int end_index = arr.length;
    do {
      for(int i = 1; i < end_index; i++) {
        DBG.append(i);
        if(arr[i-1] > arr[i]) {
          int h = arr[i];
          arr[i] = arr[i-1];
          arr[i-1] = h;        
        }
        DBG.clear();
      }
      end_index--;
    } while(end_index > 0);
    delay(100);
    return arr;
  }
}
