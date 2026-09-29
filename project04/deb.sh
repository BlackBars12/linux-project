echo "Маркдовн отчёт "
echo "Papka $2"
new_folder="$HOME/projects/project04/MARKDOWN$2"
mkdir $new_folder
cd MARKDOWN$2
apt download $1

FILE_NAME=$(ls $1*.deb)

mkdir my_data
dpkg -x $FILE_NAME my_data 
mkdir my_META
dpkg -e $FILE_NAME my_META

text="
$(figlet -f block $1)

$(apt show $1 2>/dev/null | sed 's/$/  /' | sed -E 's/(^\b.+?:) /**\1** /g')

# Структура пакета
$(tree -L 3  my_data 2>/dev/null)

# Файл Preinst
$(cat  my_META/preinst 2>/dev/null)

# Файл Postinst
$(cat  my_META/postinst 2>/dev/null)

# Файл Prerm
$(cat  my_META/prerm 2>/dev/null)

# Файл Postrm
$(cat  my_META/postrm 2>/dev/null)
"

echo "$text">"MARKDOWN.md"
