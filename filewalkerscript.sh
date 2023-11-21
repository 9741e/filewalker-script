#!/bin/bash
echo
echo "Автор: Антропов Евгений гр.730-1"
echo "Название: filewalker"
echo "Описание: скрипт принимает от вас расширения A и B и меняет расширение A файлов в текущем каталоге на расширение B" 
echo
while true; do 
	echo "Текущая директория:" 
	pwd
	echo
	echo "Введите первое расширение:"
	read first
	echo
	count=`ls -1 *."$first" 2>/dev/null | wc -l`
	if [ $count != 0 ]
	then
		echo "Введите второе расширение:"
                read second
		for file in *."$first"; do
			mv -- "$file" "${file%.$first}.$second" 2>>errors
		done
		echo
		while true; do
			echo "Cкрипт завершил свое выполнение, запустить заново? [y/n]"
			read decide
			echo
			if [ $decide == "y" ]
			then
				break
			elif [ $decide == "n" ]
			then
				exit 0
			fi
		done
	else
		echo "Файлы с расширением $first не найдены, попробуйте снова"
		echo "Файлы с расширением $first не найдены, попробуйте снова" >> errors
		echo
	fi
done
