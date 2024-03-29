#include <iostream>

using namespace std;

#define bitOf(num, bit) ((num >> bit) & 1)

int main() {
	//тип a, b легко меняется на int, long и т.д. Пишу, потому что увидел, что программа должна учитывать 32 битные целые числа(short убрать вроде не проблема)
	short int a;
	short int b;

	cin >> a;
	cout << a << endl;
	
	for (int i = sizeof(a) * 8 - 1; i >= 0; i--)
		cout << bitOf(a, i);
	cout << endl;

	b = ((a << 1) ^ (a >> sizeof(a) * 8 - 1));

	for (int i = sizeof(b) * 8 - 1 ; i >= 0; i--)
		cout << bitOf(b, i);
	cout << endl << b;

	system("pause");
	return 0;
}
