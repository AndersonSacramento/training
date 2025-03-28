#include <iostream>

using namespace std;



class Vector {
public:
  Vector(int s) : elem{new double[s]}, sz{s}{} // construct a Vector
  double& operator[](int i) {
    return elem[i];
  }
  int size(){
    return sz;
  }
private:
  double* elem; // pointer to the  elements
  int sz; // the number of elements
};
           

int main()
{
  Vector v(6);

  v[0] = 12;

  cout << "Value at 0: " << v[0] << '\n';

}
