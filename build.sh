#!/bin/bash

# Remove anything existing
sudo rm ./shbin/*
sudo rm ~/.var/app/org.citra_emu.citra/data/citra-emu/load/mods/00040000001B8700/romfs/shaders/3DS/*

# Assemble Everything
picasso ./homebrew/block_overlay.vsh -o ./shbin/block_overlay.shbin
picasso ./homebrew/color.vsh -o ./shbin/color.shbin
picasso ./homebrew/renderchunk.vsh -o ./shbin/renderchunk.shbin
#picasso ./homebrew/color_uv.vsh -o ./shbin/color_uv.shbin
# Remove this since its broken for now
picasso ./homebrew/sky.vsh -o ./shbin/sky.shbin

# Create game mod Folder
sudo mkdir -p ~/.var/app/.org.citra_emu.citra/data/citra-emu/load/mods/00040000001B8700/romfs/shaders/3DS/

# Copy everything to game mod Folder
sudo cp -r ./shbin/* ~/.var/app/org.citra_emu.citra/data/citra-emu/load/mods/00040000001B8700/romfs/shaders/3DS/
