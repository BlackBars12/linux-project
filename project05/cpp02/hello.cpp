#include <iostream>
using namespace std;
#include "CLI11.hpp"
#include "ctime"

int main (int argc, char* argv[])
{
	CLI::App app{"Моё приложение"};


	int minn;
	int maxx;
	int count;

	app.add_option("min",minn,"min значение");
	app.add_option("max",maxx,"max значени");
	app.add_option("count",count,"количество");
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
