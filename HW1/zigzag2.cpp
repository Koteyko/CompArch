using namespace std;

#define bitOf(num, bit) ((num >> bit) & 1)

int main() {
	short int a;
	short int b;

	cin >> a;
	cout << a << endl;
	for (int i = sizeof(a) * 8 - 1; i >= 0; i--)
		cout << bitOf(a, i);
	cout << endl;

	b = ~(a >> 1);

	for (int i = sizeof(b) * 8 - 1 ; i >= 0; i--)
		cout << bitOf(b, i);
	cout << endl << b;

	system("pause");
	return 0;
