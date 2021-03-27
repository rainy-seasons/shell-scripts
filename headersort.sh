#! /bin/bash
# script for moving files into categorized directories

# create directories if they don't exist
[[ -d images ]] || mkdir images
[[ -d videos ]] || mkdir videos
[[ -d music ]] || mkdir music

sortfiles() {
header=$(file $1)
if [[ ! -z $header ]] && [[ ! $header == *"directory"* ]]
then
  if [[ $header == *"image"* ]] || [[ $header == *"bitmap"* ]]
  then
    echo "moving" $1 "to images"
    mv $s images
  elif [[ $header == *"Audio"* ]] || [[ $header == *"audio"* ]]
  then
    echo "moving" $1 "to music"
    mv $1 music
  elif [[ $header == *"MP4"* ]] || [[ $header == *"Matroska"* ]] || [[ $header == *"Video"* ]]
  then
    echo "moving" $1 "to videos"
    mv $1 videos
  fi  
fi
return
}

for s in *
do
  sortfiles $s
done
