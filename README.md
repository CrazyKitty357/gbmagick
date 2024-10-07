# GBMagick
a basic image converter for gbstudio.

## Dependancies
Imagemagick
## Prerequisite Command
this generates the palette.png that is used for the ``--mono`` flag.
```
magick xc:"#071821" xc:"#306850" xc:"#86c06c" xc:"#e0f8cf" +append palette.png
```
## Usage
to generate an image
```
./main.sh input.png out.png
```
to generate the mono image
```
./main.sh --mono input.png out.png
```