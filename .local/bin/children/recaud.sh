ffmpeg -y -f x11grab -s 1920x1080 -i :0.0 -f alsa -ac 2 -i pulse -acodec aac ~/Documents/video/audout.mkv
