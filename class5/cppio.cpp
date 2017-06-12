#include<iostream>
#include<string>

int main() {
  int count;
  std::string str; 
  
  std::cout << "Enter a number: ";
  std::cin >> count;
  std::cout << "Enter a string: ";
  std::cin >> str;      // Only gets characters until next whitespace
 
  for (int ii=0;ii<count;ii++) {
    std::cout << ii << ": " << str << std::endl;
  } 
  return 0;
}
