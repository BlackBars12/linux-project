#include <iostream>
using namespace std;
#include "CLI11.hpp"
#include "ctime"

int main (int argc, char* argv[])
{
	CLI::App app{"Моё приложение"};


	if (argc<4){
		cout << "Ошибка использовани " << argv[0] << "<max> <min> <количество>" << endl;
		return 1;
	}

	int minn;
	int maxx;
	int count;

	app.add_option("-n,--min",minn,"min значение");
	app.add_option("-m,--max",maxx,"max значени");
	app.add_option("-c,--count",count,"количество");
	CLI11_PARSE(app, argc, argv);

	if (minn > maxx){
		cout << "Минимальный элемент не может быть больше максимального " << endl;
		return 1;
	}
	srand(time(nullptr));

	for (int i = 0; i < count; i++){
		int rundom= minn+rand() % (maxx-minn+1);
		cout << rundom << endl;
	}
	return 0;


}
