#include <iostream>
#include <sys/inotify.h>
#include <unistd.h>
#include <fstream>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {
	// создаем файловый дескриптор для отслеживания
	int inotify_fd = inotify_init();

	// подключаем к inotify_fd мониторинг,
	// "/home/m" -- эта папка которую мониторим
	// IN_MODIFY | IN_CREATE | IN_DELETE -- события которые мониторим
	int watch_fd = inotify_add_watch(inotify_fd, "/home/a", IN_MODIFY | IN_CREATE | IN_DELETE);


	while(true) {
		char buffer[10000]; // буфер под события изменений

		// подключаемся к inotify_fd на чтение 
		// эта строчка блокирует программу, 
		// пока не произойдет какое-нибудь изменение
		int length = read(inotify_fd, buffer, 10000);

		// так как событие может прийти несколько то надо их все обойти
		int i = 0;
		while (i < length) {
			// вытаскиваем инфу по событию
			struct inotify_event *event = (struct inotify_event *)&buffer[i];

			// проверим тип события
			if (event->mask & IN_MODIFY) {
				cout << "---\nФайл " << event->name << " изменился, его новое содержимое: " << endl;
				// Код чтения из вашей второй картинки (с подставлением пути к файлу):
				std::ifstream ifs("/home/a/" + string(event->name));
				std::string content;
				if (ifs.is_open()) {
					content.assign((std::istreambuf_iterator<char>(ifs)), (std::istreambuf_iterator<char>()));
					ifs.close();
				}
				cout << content << endl; // Выводим считанное содержимое
			}
			else if (event->mask & IN_CREATE) {
				cout << "создали файл " << event->name << endl;
			}

			else if (event->mask & IN_DELETE) {
				cout << "---\nФайл " << event->name << " удален" << endl;
			}

			// сдвигаемся на следующее событие
			i += sizeof(struct inotify_event) + event->len;
		}

	}

	inotify_rm_watch(inotify_fd, watch_fd);
	close(inotify_fd);
	return 0;
}

