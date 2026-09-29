echo "Маркдовн отчёт "
echo "Papka $2"
new_folder="$HOME/projects/project04/MARKDOWN$2"
mkdir $new_folder
cd MARKDOWN$2
apt download $1

FILE_NAME=$(ls $1*.deb)

mkdir my_data my_META
dpkg -x $FILE_NAME my_data 
dpkg -e $FILE_NAME my_META

text="
$(figlet -f block $1)

$(apt show $1 2>/dev/null | sed 's/$/  /' | sed -E 's/(^\b.+?:) /**\1** /g')

# Структура пакета

$(tree -L 3  my_data 2>/dev/null)

## Файл Preinst

$(sed 's/^/    /' my_META/preinst 2>/dev/null)

## Файл Postinst

$(sed 's/^/    /' my_META/postinst 2>/dev/null)

## Файл Prerm

$(sed 's/^/    /' my_META/prerm 2>/dev/null)

## Файл Postrm

$(sed 's/^/    /' my_META/postrm 2>/dev/null)
"
echo "$text">"MARKDOWN.md"



rm -rf my_data
rm -rf my_META


