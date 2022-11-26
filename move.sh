#!/bin/bash


function menu1 {
	cat <<-ans1
	STEP1: WHAT FOLDER WOULD YOU LIKE TO MOVE FROM?

	[1]  Torrent Complete - /home/planet/Downloads/Torrent $(( `/usr/bin/find '/home/planet/Downloads/Torrent' -maxdepth 1 -type d | wc -l` - 1 )) folders, $(/usr/bin/find '/home/planet/Downloads/Torrent' -type f | wc -l) files
	[2]  Torrent Incomplete - /home/planet/Incomplete/Torrent $(( `/usr/bin/find '/home/planet/Incomplete/Torrent'  -maxdepth 1 -type d | wc -l` - 1 )) folders, $(/usr/bin/find '/home/planet/Incomplete/Torrent' -type f | wc -l) files
	[3]  JDownloader Complete - /home/planet/Downloads/JDownloader $(( `/usr/bin/find '/home/planet/Downloads/JDownloader'  -maxdepth 1 -type d | wc -l` - 1)) folder, $(/usr/bin/find '/home/planet/Downloads/JDownloader' -type f | wc -l) files
	[4]  JDownloader Incomplete - /home/planet/Incomplete/JDownloader $(( `/usr/bin/find '/home/planet/Incomplete/JDownloader' -maxdepth 1 -type d | wc -l` - 1 )) folders, $(/usr/bin/find '/home/planet/Incomplete/JDownloader' -type f | wc -l) files
	[5]  Soulseek Complete - /home/planet/Downloads/Soulseek $(( `/usr/bin/find '/home/planet/Downloads/Soulseek' -maxdepth 1 -type d | wc -l` - 1 )) folders, $(/usr/bin/find '/home/planet/Downloads/Soulseek' -type f | wc -l) files
	[6]  Soulseek Incomplete - /home/planet/Incomplete/Soulseek $(( `/usr/bin/find '/home/planet/Incomplete/Soulseek' -maxdepth 1 -type d | wc -l` - 1 )) folders, $(/usr/bin/find '/home/planet/Incomplete/Soulseek' -type f | wc -l) files
	[7]  Nzbget Complete - /home/planet/Downloads/Nzbget $(( `/usr/bin/find '/home/planet/Downloads/Nzbget' -maxdepth 1 -type d | wc -l` - 1 )) folders, $(/usr/bin/find '/home/planet/Downloads/Nzbget' -type f | wc -l) files
	[8]  Nzbget Incomplete - /home/planet/Incomplete/Nzbget $(( `/usr/bin/find '/home/planet/Incomplete/Nzbget' -maxdepth 1 -type d | wc -l` - 1 )) folders, $(/usr/bin/find '/home/planet/Incomplete/Nzbget' -type f | wc -l) files
	[9]  SABnzbd Complete - /home/planet/Downloads/SABnzbd $(( `/usr/bin/find '/home/planet/Downloads/SABnzbd' -maxdepth 1 -type d | wc -l` - 1 )) folders, $(/usr/bin/find '/home/planet/Downloads/SABnzbd' -type f | wc -l) files
	[0]  SABnzbd Incomplete - /home/planet/Incomplete/SABnzbd$(( `/usr/bin/find '/home/planet/Incomplete/SABnzbd' -maxdepth 1 -type d | wc -l` - 1 )) folders, $(/usr/bin/find '/home/planet/Incomplete/SABnzbd' -type f | wc -l) files

	ans1

	read -p 'Please input which folder number you want to move contents from: ' ans1

	case $ans1 in
		1) dir="/home/planet/Downloads/Torrent"		;;
		2) dir="/home/planet/Incomplete/Torrent"	;;
		3) dir="/home/planet/Downloads/JDownloader"	;;
		4) dir="/home/planet/Incomplete/JDownloader";;
		5) dir="/home/planet/Downloads/Soulseek"	;;
		6) dir="/home/planet/Incomplete/Soulseek"	;;
		7) dir="/home/planet/Downloads/Nzbget"		;;
		8) dir="/home/planet/Incomplete/Nzbget"		;;
		9) dir="/home/planet/Downloads/SABnzbd"     ;;
		0) dir="/home/planet/Incomplete/SABnzbd"    ;;
		*) menu1 ;;
	esac

	read -p "confirm that folder $dir is selected, correct? [Y/n] " confirm

	case $confirm in
		yes|YES|Y|y)
			echo "SOURCE FOLDER IS SET AS $dir.";;
		*) menu1 ;;
	esac

}

function menu2 {
	echo "STEP 2: WHAT FILES AND FOLDERS WOULD YOU LIKE TO MOVE ?"

	i=1
	ls $dir \
		| while read file; do
			echo "[$i] ${file}"
			let i++
		done > .all
	i=1
	ls $dir \
		| while read file; do
			echo "[$i] ${file}"
			let i++
		done

	cat<<-info

	Please input which files you want to move to the destination separated by a comma.

info

	read -p "Type ALL to move all files in the folder to the destination: " list
	all=($(echo "$list" | sed 's/,/ /g' 2> /dev/null))

	if [[ $list == "ALL" ]];then
		all=($(< .all))
	elif [[ ${#all[@]} -gt 1 ]];then
		:
	else
		grep "^\[$list" .all &> /dev/null || menu2
	fi


	sed -i '/^/d' .tobemoved
	for i in ${all[@]};do
		grep "^\[$i" .all | sed 's/\[[0-9]\] //g' | tee -a .tobemoved
	done

	read -p "confirm that $list is correct? [Y/n] " confirm

	case $confirm in
		yes|YES|Y|y)
			echo "ANSWER ACCEPTED!";;
		*) menu2 ;;
	esac
}


function menu3 {
	cat<<-INFO

	STEP 3: WHAT FOLDER WOULD YOU LIKE TO MOVE TO?

	[1] Audiobooks - /external/Audiobooks/
	[2] Movies - /external/Movies/
	[3] Music - /external/Music/
	[4] Music New - /external/NewMusic/
	[5] Series - /external/Series/
	[6] Nintendo - /external2/NintendoSwitch/
	[7] Play - /external2/Play/Play/
	[8] Play New - /external2/Play/PlayNew/
	[9] Play Old - /external2/Play/PlayOld/

INFO

	read -p 'Please input which folder number you want to move contents to: ' answer

	case $answer in
		1) dest="/external/Audiobooks/" 		;;
		2) dest="/external/Movies/" 			;;
		3) dest="/external/Music/"			;;
		4) dest="/external/NewMusic/"		;;
		5) dest="/external/Series/"			;;
		6) dest="/external2/NintendoSwitch/"        ;;
		7) dest="/external2/Play/Play/"		;;
		8) dest="/external2/Play/PlayNew/"		;;
		9) dest="/external2/Play/PlayOld/"		;;
		*) menu					;;
	esac

	read -p "confirm that folder $dest is selected, correct? [Y/n] " confirm

	case $confirm in
		yes|YES|Y|y)
			echo "ANSWER ACCEPTED";;
		*) menu3 ;;
	esac

}



function menu4 {
	cat<<-info

	STEP 4: SUMMARIZE AND COPY

	Source folder: ------------> $dir

	Source folder files:
	$(ls $dir)

	Print of file(s) to be moved
	$(cat .tobemoved)

	Destination folder: -------> $dest

	--------------------------
	--------------------------

info
	read -p 'IS THIS CORRECT [Y/N/EXIT] ' ans
	case $ans in
		Y|y)
			while read file;do
				echo "mv $dir/$file $dest"
				mv "$dir/$file" "$dest"
			done < .tobemoved
			echo "MOVED!"
		;;
		N|n) main ;;
		EXIT|e) exit 0 ;;
		*) menu4 ;;
	esac
}


function menu5 {
	read -p 'STEP 5: REPEAT OR QUIT? [R/EXIT] ' ans

	case $ans in
		R|r) main ;;
		EXIT|exit|e) exit 0;;
	esac

}

function main {

	menu1
	menu2
	menu3
	menu4
	menu5
	#sh /home/planet/Headless/plexown.sh
}

main
