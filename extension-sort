#! /bin/bash

make-directories-if-not-exist() {
  [[ -d images ]] || mkdir images
  [[ -d videos ]] || mkdir videos
  [[ -d music ]] || mkdir music
}

execute() {
  for s in *
  do  
    [[ ${check-validity "$s"} ]] && sort-files "$s" # check validity of each file and categorize it
  done
}

check-validity() {
  [[ -f $1 ]] && return 0 # check if it's a file - return true
}

sort-files() {
  if [[ $1 == *.@(png|jpg|bmp|jpeg) ]]
  then
    echo "$1 to $PWD/images"
    mv $1 images
  elif [[ $1 == *.@(mpv|mp4|mkv) ]]
  then
    echo "$1 to $PWD/videos"
    mv $1 videos
  elif [[ $1 == *.@(mp3|wav|flac) ]]
  then
    echo "$1 to $PWD/music"
    mv $1 music
  elif [[ $1 == *.@(yml) ]]
  then
    echo "deleting $PWD/$1"
    rm $1
  fi  
}

make-directories-if-not-exist
execute
