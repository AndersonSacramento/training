#include <iostream>

using namespace std;

enum class Traffic_light {green, yellow, red};

Traffic_light operator++(Traffic_light& t)
{
  switch(t) {
  case Traffic_light::green: return t = Traffic_light::yellow;
  case Traffic_light::yellow: return t = Traffic_light::red;
  case Traffic_light::red: return t = Traffic_light::green;
  }
}

int main()
{
  enum class Color {red, blue, green};


  Color col = Color::red;
  Traffic_light light = Traffic_light::red;
  Traffic_light next = ++light;

  if (next == Traffic_light::green)
    cout << "green" << endl;
}
