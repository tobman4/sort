int[] arr;
IntList DBG;

boolean sorting = false;
boolean sorted = true;

int show_delay = -1;

void setup() {
  size(600,600);
  arr = new int[width];
  DBG = new IntList();
  for(int i = 0; i < width; i++) {
    arr[i] = round(map(i,0,width,0,height));
  }
}

void start_sort() {
  sorting = true;
  // just to get cool colors
  Sorter x = new Bubble();
  x.Sort(arr);
  sorting = false;
  sorted = true;
}

void draw() {
  background(0);
  _draw_stuff();
  
  if(show_delay != -1) {
    delay(show_delay);
    show_delay = -1;
  }
  
  if(sorted && !sorting) {
    shuffel();
  } else if(!sorted && !sorting) {
    thread("start_sort");
  }
}

void _draw_stuff() { // use to DBG
  for(int i = 0; i < arr.length; i++) {
    if(DBG.hasValue(i)) {
      stroke(255,0,255);
    } else {
      stroke(255);
    }
    line(i,height,i,height-arr[i]);
  }
}

void shuffel() {
  for(int i = 0; i < arr.length*2; i++) {
    int j = round(random(0,arr.length-1));
    int l = round(random(0,arr.length-1));
    if(l != j) {
      // so fancy me are :)
      arr[l] = arr[l] + arr[j];
      arr[j] = arr[l] - arr[j];
      arr[l] = arr[l] - arr[j];
    }
  }
  show_delay = 500;
  sorted = false;
}
