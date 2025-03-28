#include <iostream>

using namespace std;


int main()
{
  int x = 2;
  int y = 3;
  int* p = &x;
  int* q = &y;
  p = q;


  cout << "p: " << *p <<  " q: " << *q << endl;
  cout << "x: " << x <<  " y: " << y << endl;

  x = 2;
  y =  3;
  int& r = x;
  int& r2 = y;
  r = r2;

  cout << "r: " << r <<  " r2: " << r2 << endl;
  cout << "x: " << x <<  " y: " << y << endl;
  
}
