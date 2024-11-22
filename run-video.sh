
# -framerate {self.fps} \

ffmpeg \
-f rawvideo \
-pixel_format bgr24 \
-video_size 640x480 \
-i /dev/zero \
-vf format=nv12 \
-c:v libx264 \
-preset ultrafast \
-tune zerolatency \
-f rtsp \
rtsp://192.168.1.204:8554/stream

# rtsp://192.168.1.204:8554/stream