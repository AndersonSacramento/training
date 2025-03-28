#include <iostream>
#include <vector>

using namespace std;


void some_function()
{
  double d = 2.2;
  int i = 7;
  d = d + i;
  i = d * i;

  cout << "d and i: " << d << "\t" << i << endl;
}


void print()
{
  int v[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

  for (auto x : v)
    cout << x << '\n';

  for (auto x : {10, 21, 32, 43, 54, 65})
    cout << x << '\n';
}
  
int main()
{
  some_function();

  vector<int> v {1, 2, 3, 4, 5, 6};

  cout << v[0] << endl;

  print();
}
