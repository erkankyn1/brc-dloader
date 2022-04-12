#!/bin/bash

echo "
██████╗ ██████╗  ██████╗    ██████╗ ██╗      ██████╗  █████╗ ██████╗
██╔══██╗██╔══██╗██╔════╝    ██╔══██╗██║     ██╔═══██╗██╔══██╗██╔══██╗
██████╔╝██████╔╝██║         ██║  ██║██║     ██║   ██║███████║██║  ██║
██╔══██╗██╔══██╗██║         ██║  ██║██║     ██║   ██║██╔══██║██║  ██║
██████╔╝██║  ██║╚██████╗    ██████╔╝███████╗╚██████╔╝██║  ██║██████╔╝
╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝

BigBlueButton Record Downloader v1

[*] Coded by Erkan Yıldırım
[*] Twitter: @lsb1k
"

read -p "[1] File
[2] URL
>>> " askfileorurl
askfileorurl="${askfileorurl//[$'\t\r\n ']}"

bblink=""

function downloadfromurl {
        rm deskshare.webm webcams.webm 2> /dev/null
        newbbb=$(echo $bbblink | cut -d "/" -f 7)
        wget "https://bbb-url/presentation/"$newbbb"/deskshare/deskshare.webm"
        wget "https://bbb-url/presentation/"$newbbb"/video/webcams.webm"

        ffmpeg -nostdin -i webcams.webm -i deskshare.webm -c copy $newbbb.webm

        echo "Record downloaded."
}


if [ $askfileorurl == "1" ]
then
        read -p "Type filename: " filename
        while IFS='' read -r bbblink
        do
                echo "$bbblink"
                downloadfromurl

        done < "$filename"

elif [ $askfileorurl == "2" ]
then
        read -p "Type URL: " bbblink
        downloadfromurl


else
        echo "Please type 1 or 2."
fi

rm deskshare.webm webcams.webm 2> /dev/null
