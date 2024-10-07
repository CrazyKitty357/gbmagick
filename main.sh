#!/bin/bash

## Generate the gbstudio mono palette by running
# magick xc:"#071821" xc:"#306850" xc:"#86c06c" xc:"#e0f8cf" +append palette.png

# Check if ImageMagick (magick) is installed
if ! command -v magick &> /dev/null
then
    echo "ImageMagick (magick) could not be found. Please install it to proceed."
    exit
fi

# Palette file for --mono flag
PALETTE="palette.png"

# Function to apply the monochrome color palette
apply_mono_palette() {
    local input_image=$1
    local output_image=$2

    # Resize the image and map the colors to the custom palette
    magick "$input_image" -resize 160x144^ -gravity center -extent 160x144 \
    -dither None -remap "$PALETTE" "$output_image"

    echo "Image has been resized to 160x144 and color palette set to 4 colors (dark to light)."
}

# Function for default behavior (reduce colors to 4 without --mono flag)
default_palette() {
    local input_image=$1
    local output_image=$2

    # Resize the image and reduce colors to 4
    magick "$input_image" -resize 160x144^ -gravity center -extent 160x144 -colors 4 "$output_image"

    echo "Image has been resized to 160x144 and color palette reduced to 4 colors."
}

# Parse input arguments
if [ "$1" == "--mono" ]; then
    # Use the monochrome palette
    INPUT_IMAGE=$2
    OUTPUT_IMAGE=$3

    # Check if input and output files are provided
    if [ -z "$INPUT_IMAGE" ] || [ -z "$OUTPUT_IMAGE" ]; then
        echo "Usage: $0 [--mono] input_image output_image"
        exit 1
    fi

    # Apply the monochrome palette
    apply_mono_palette "$INPUT_IMAGE" "$OUTPUT_IMAGE"
else
    # Default behavior (no --mono flag)
    INPUT_IMAGE=$1
    OUTPUT_IMAGE=$2

    # Check if input and output files are provided
    if [ -z "$INPUT_IMAGE" ] || [ -z "$OUTPUT_IMAGE" ]; then
        echo "Usage: $0 [--mono] input_image output_image"
        exit 1
    fi

    # Apply the default palette (4 colors)
    default_palette "$INPUT_IMAGE" "$OUTPUT_IMAGE"
fi
