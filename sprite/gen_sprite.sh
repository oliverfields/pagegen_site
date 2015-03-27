#!/bin/bash

# Concatinate sprites (png images) in source dir into single sprite file and generate CSS for each sprite
# Important for reuse that sequence of image files is consistent so use appropriate naming convention, e.g. prefix source images with 001_, 002_ etc

bg_colors=(red green blue white black)

script_dir="$HOME/Personal/projects/pagegen/pagegenv2_site/sprite"
page="$script_dir/sprite.html"
sprite="$script_dir/sprite.png"
src_dir="$script_dir/source"


[ -e "$page" ] && rm "$page"
[ -e "$sprite" ] && rm "$sprite"


# Add icons and graphics to sprite
convert "$src_dir/"*.png +append "$sprite"

# Lossless compression
optipng -o 2 -quiet "$sprite"

# CSS for test page
echo "<style>* {font-family: sans-serif; font-size: 10px;} h1 {font-size: 3em; } tr:hover{ background-color: #ccc; }</style><h1>Backgrounds</h1>" >> "$page"

# Generate html for preview
for  c in ${bg_colors[@]}; do
  echo "<div style=\"text-align: center; background-color: $c;\"><img src=\"$sprite\" /></div>" >> "$page"
done

echo "<h1>CSS</h1>" >> "$page"
# Generate css
echo "<table>" >> "$page"
sprite_start=0
last_width=0
for f in "$src_dir/"*.png; do
  file_info="$(identify "$f")"
  read -r file_name type size rest <<< "$file_info"

  file_name="${file_name##*/}"
  width=${size%x*}
  height=${size#*x}

  sprite_start=$(($sprite_start + $last_width))

  #echo "F: $file_name W: $width H: $height Sprite start: $sprite_start Last width: $last_width"

  css="background-image: url('${sprite##*/}'); background-repeat: no-repeat; width: ${width}px; height: ${height}px; background-position: -${sprite_start}px 0px;"
  echo "<tr><td>$file_name</td><td><div style=\"$css\"></td><td>.${file_name%.*} { $css }</td></tr>" >> "$page"

  last_width="$width"
done
echo "</table>" >> "$page"
