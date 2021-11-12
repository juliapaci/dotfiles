ffmpeg -y -f x11grab -s 1920x1080 -i :0.0 -f alsa -i hw:2 ~/Documents/video/out.mkv
