# GBMagick
a basic image converter for gbstudio.

## Dependancies
Imagemagick
## Prerequisite Command
this generates the palette.png that is used for the ``--mono`` flag. *The color sceme used is the default gbstudio mono color palette*
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
## Helpful info
I also made an [imgur album](https://imgur.com/a/RDVAVAN) that might be helpful to people using this program, it documents how GBStudio's auto palette feature works (and breaks down when using higher colors on "complex" images)