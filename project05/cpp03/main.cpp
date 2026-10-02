#include <iostream>
using namespace std;

int main(int argc, char* argv[]) { 
        string line;
	int max = 0;
        while (true) {
                getline(cin, line); // считываем введенные цифры
                if (line == "") // если числа закончились, то выходим из цикла
                        break;
		int a = atoi(line.c_str()); // преобразуем строку в число
                if (max < a) max=a;
	}
	cout << "Максимальное число " << max;
	return 0;
}
