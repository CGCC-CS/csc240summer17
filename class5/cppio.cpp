#include<iostream>
#include<string>

int main() {
  int count, ii;
  std::string str; 
  
  std::cout << "Enter a number: ";
  std::cin >> count;
  std::cout << "Enter a string: ";
  std::cin >> str;
 
  for (ii=0;ii<count;ii++) {
    std::cout << ii << ": " << str << std::endl;
  } 
  return 0;
}
