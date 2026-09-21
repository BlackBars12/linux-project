echo "Ваша программа называется: $0"
echo "Ваш первый параметр: $1"
echo "Ваш второй параметр: $2"

papkaif="/home/a/projects/project03/project_$1"

if [ -d "$papkaif" ]
then
	echo "Папка уже существует, назовите её по другому" 
	exit 0
fi

my_var="первый: $1 второй: $2"
echo "Значение my_var = ${my_var}"
new_folder_name="$HOME/projects/project03/project_$1"

mkdir $new_folder_name
text="
 ______   ______     ______       __     ______     ______     ______  
/\  == \ /\  == \   /\  __ \     /\ \   /\  ___\   /\  ___\   /\__  _\ 
\ \  _-/ \ \  __<   \ \ \/\ \   _\_\ \  \ \  __\   \ \ \____  \/_/\ \/ 
 \ \_\    \ \_\ \_\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\ 
  \/_/     \/_/ /_/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/ 
                                                                       
# Название проект $1 
### Попытка номер 2 создать файл 
__*и скомментировать его в гит*__
$2"

echo  "$text" > "${new_folder_name}/README.md"

cd project_$1
nano README.md
cd ..

ssh-keygen -t ed25519 -f "$papkaif/ed25519" -N "" -q
echo "$papkaif/ed25519" >> ~/.ssh/config
echo "Ссылка на репозиторий https://github.com/BlackBars12/linux-project/tree/main"
echo "Ваш публичный ключ"
cat "$papkaif/ed25519.pub"

exit 0
