#!/bin/bash
if [ -n "$1" ]
then
for f in $(grep -i .jpg $1)
do
if [ $(file ./$f | awk '{print $2 }') = "JPEG" ]
then	
name=$(basename "$f" .jpg)
read w h <<< $(identify -format "%w %h" "$f")
if [ $w -gt $h ]
then
convert "$f" -resize 360 $name"_thumbnail.jpg" 
else
convert "$f" -resize x360 $name"_thumbnail.jpg"
fi
fi
done
else
for f in  $(ls ./*.jpg 2>/dev/null | grep -vi _thumbnail.jpg)
do
if [ $(file ./$f | awk '{print $2 }') = "JPEG" ]
then
name=$(basename "$f" .jpg)
read w h <<< $(identify -format "%w %h" "$f")
if [ $w -gt $h ]
then
convert "$f" -resize 360 $name"_thumbnail.jpg"
else
convert "$f" -resize x360 $name"_thumbnail.jpg"
fi
fi
done
fi
