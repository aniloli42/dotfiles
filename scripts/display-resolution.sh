dpi=${1:-112}

if [ ! -f ../.Xresources ]; then
  touch ../.Xresources
fi

echo "Xft.dpi: $dpi" > ../.Xresources

xrdb ~/.Xresources

