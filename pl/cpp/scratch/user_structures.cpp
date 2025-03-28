#include <iostream>

using namespace std;


struct Vector {
  int sz;  // number of elements
  double* elem; // pointer to elements
};


void vector_init(Vector& v, int s)
{
  v.elem = new double[s]; // allocate an  array of s doubles
  v.sz = s;
}

double read_and_sum(int s)
{
  Vector v;
  vector_init(v, s);

  for(int i=0; i < s; i++)
    cin >> v.elem[i];

  double sum = 0;
  for (int i = 0; i < s; i++)
    sum += v.elem[i];

  return sum;
}
  
int main()
{
  cout << "Enter values: ";
  double sum = read_and_sum(3);
  cout << "Sum: " << sum << endl;
}
