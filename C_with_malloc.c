#include <stdio.h>

    // a is a pointer to the array to be sorted
    // n is the number of elements in the array
void qsort2(int *a, int n){
    int *i = a; // start of array
    int *j = a + n; // end of array
    int pivot = *i; // set pivot to value at the start of array
    int temp; // temp variable for swapping

    // while i position is before j position (left side before right side)
    while(i < j){
        // while pivot value <= j value AND i position is before j postion
        // keeps decrementing from end of array until pivot is greater than j value
        while(pivot <= *j && i < j){
            // decrement j position
            j--;
        }

        // if only the i position is before j position
        // j value is less than pivot
        // moves j value to left of pivot
        if(i < j){
            // swap the value in i position with the value in j position
            temp = *i;
            *i = *j;
            *j = temp;
            // increment i position
            i++;
        }

        // while i value <= pivot value AND i position is before j postion
        // keeps incrementing from start of array until i value is greater than pivot
        while(*i <= pivot && i < j){
            // increment i position
            i++;
        }

        // if i position is before j position
        // pivot is less than i value
        // moves i value to right of pivot
        if(i < j){
            // swap the value in j position with the value in i position
            temp = *j;
            *j = *i;
            *i = temp;
            // decrement j position
            j--;
        }
    }

    // if i position and j position are the same (reached the middle)
    if(i == j){
        // i value (at the middle) now holds pivot value
        *i = pivot;
        // lower partition
        int low = i - a - 1;
        // higher partition
        int high = a + n - i - 1;

        // repeat sort at lower partition
        // from the start of array
        // to the position before the i position (middle)
        qsort2(a, low);
        // repeat sort at higher partition
        // from the position after the i position (middle)
        // to the end of array
        qsort2(i + 1, high);
    }
}

void merge(int *a, int left, int middle, int right)
{
  //initializing parameters for the loops
    int i = 0;
    int j = 0;
    int k = left;

//gets size of the left side
    int left_size = middle-left+1;

    //gets size of the right side
    int right_size = right - middle - 1;

//initializes arrays
    int *R = malloc(right_size *sizeof(int));
    int *L = malloc(left_size *sizeof(int));

//moves the elements from the right side into its own array
    memcpy(R, a + (left_size), right_size * sizeof(int));

//moves the elements from the left side into its own array
    memcpy(L, a, left_size * sizeof(int));

//while the i-index is within the left array and j-index is within the right array (both start at zero)
    while (i < left_size && j < right_size){
      //if the element from the left array is less than or equal to the element in the right array
        if (L[i] <= R[j]){
          //set the element in the original array equal to the left element
            a[k] = L[i];
            //increment i
            i++;
        //if the element from the right array is less than or equal to the element in the left array
        } else {
          //set the element in the original array equal to the right element
            a[k] = R[j];
            //increment j
            j++;
        }
        //move on to the next element
        k++;
    }
    //if i is still within the left array
    if (i < left_size) {
      //add on the remaining left elements to the final array using pointer arithmetic
        memcpy(a + k, L + i, (left_size - i) * sizeof(int));
    }
    //while j is still within the left array
    if (j < right_size) {
      //add on the remaining right elements to the final array using pointer arithmetic
        memcpy(a + k, R + j, (left_size - j) * sizeof(int));
    }

    free(R);
    free(L);
}

//the merge-sort sorter function
void msort(int *a, int n)
{
  //sets pointer to the first element
    int *left = a;
    //sets pointer to the last element
    int *right = a + n - 1;
    //is the first element less than the last element
    if (left < right){
      //gets middle index
        int middle_index = (right - a) / 2;
        // sets end for the left array just before middle index
        int end = (right - a) - middle_index;
        //sets pointer to new array starting at middle for the right array
        int *middle = middle_index + a;

        //recursive call for left side of array
        msort(left, middle_index+1);
        //recursive call for right side of array
        msort(middle+1, end);
        //merges the sorted arrays
        merge(a, 0, middle_index, n);
    }
}

//main function that runs the two functions
int main(void) {
  // array of numbers
  int nums[] = {4, 65, 2, -31, 0, 99, 2, 83, 782, 1};
  // size of array (number of elements)
  int size = sizeof nums / sizeof *nums;

  // display initial order of array elements
  printf("Initial Order: ");
  for(int i = 0; i < size; i++){
    printf("%d  ", nums[i]);
  }

  // sort array
  qsort2(nums, size - 1);

  // display sorted order of array elements
  printf("\nQuick Sort (C): ");
  for(int i = 0; i < size; i++){
    printf("%d  ", nums[i]);
  }
  // array of numbers
  int nums1[] = {4, 65, 2, -31, 0, 99, 2, 83, 782, 1};

  // size of array (number of elements)
  int size1 = sizeof nums1 / sizeof *nums1;

//runs merge sort
  msort(nums1, size1);
  //prints the elements to the console in the sorted order
  printf("\nMerge Sort (C): ");
  for(int i = 0; i < size1; i++){
    printf("%d  ", nums1[i]);
  }
