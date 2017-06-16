#include<iostream>
#include<vector>

using namespace std;

int main() {
  vector<int> v(10);      // Create vector of size 10
  int ii;

  v = {34, 23, 30, 19};   // Initialize the vector

  // display the size of the vector
  cout << "Vector size: " << v.size() << endl;
  cout << "Vector capacity: " << v.capacity() << endl;

  // Print vector with a for loop using array syntax (UNSAFE)
  for(ii=0; ii<v.size(); ii++) {
    cout << v[ii] << " " ;
  }
  cout << endl;

  cout << "front: " << v.front() << endl;
  cout << "back: " << v.back() << endl;

  v.push_back(42);
  v.push_back(14);
  
  for(ii=0; ii<v.size(); ii++) {
    cout << v.at(ii) << " " ;
  }
  cout << endl;
  cout << "back (after push): " << v.back() << endl;

  v.pop_back();
  for(ii=0; ii<v.size(); ii++) {
    cout << v.at(ii) << " " ;
  }
   
  cout << endl;
  return 0;
}
