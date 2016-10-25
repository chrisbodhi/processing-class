int[] nums = {1, 6, 6, 7, 43, 11, 244, -4, 12};

void setup() {
  int max = findMax(nums);
  println(max);
}


int findMax(int[] someNumbers) {
  int max = someNumbers[0];
  
  for (int i=0; i < someNumbers.length; i++) {
    if (max < someNumbers[i]) {
      max = someNumbers[i];
    }
  }
  return max;
}