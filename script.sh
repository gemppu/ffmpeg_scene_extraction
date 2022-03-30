#!/bin/bash
# episode paths to array
# for ep
#   make a new directory
#   extract scenes from episode to directory using ffmpeg
rm -r frames
mkdir frames
cd frames
echo $PWD
lines=($(ls "$PWD"/../*.mkv))
echo $lines
for ep_path in ../*.mkv
do
  echo "$ep_path"
  scenes_path=${ep_path:3:-4}_scenes
  echo "$scenes_path"
  mkdir "$scenes_path"
  ffmpeg -i "$ep_path" -filter:v "select='gt(scene,0.9)', showinfo" -vsync 0 "$scenes_path"/%04d.jpg

done
#ffmpeg -i \[Sephirotic\]\ Evangelion\ -\ 01\ \[MULTI\]\[BD\ 1080p\ 8bits\ 5.1\ AAC\]\[6B1607E9\].mkv -filter:v "select='gt(scene,0.9)',showinfo" -vsync 0 frames/%05d.jpg

