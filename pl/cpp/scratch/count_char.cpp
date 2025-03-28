#include <iostream>

using namespace std;


int count_x(char *p, char x)
{
  if (p == nullptr) return 0;

  int count = 0;
  for( ; *p!=0; ++p) {
    if (*p == x)
      count++;
  }    
  return count;
}
  
int main()
{
  char name[] = {'a', 'n', 'd', 'e', 'r', 's', 'o', 'n', 'a', 0};
  cout << count_x(name, 'a') << endl;
}
