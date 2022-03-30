#!/bin/bash
# make new directory frames
# for ep in current directory
#   make new directory inside frames
#   extract scenes from episode to directory using ffmpeg
mkdir frames
cd frames
echo $PWD
for ep_path in ../*.mkv
do
  echo "$ep_path"
  scenes_path=${ep_path:3:-4}_scenes
  echo "$scenes_path"
  mkdir "$scenes_path"
  ffmpeg -i "$ep_path" -filter:v "select='gt(scene,0.9)', showinfo" -vsync 0 "$scenes_path"/%04d.jpg
done

