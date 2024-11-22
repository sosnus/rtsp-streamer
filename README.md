# rtsp-streamer
 
# 1. server
Run server. execute command:
``` bash
docker run --rm -it -e RTSP_PROTOCOLS=tcp -p 8554:8554 -p 1935:1935 -p 8888:8888 aler9/rtsp-simple-server
```

# 2. start streaming
``` bash
ffmpeg -re -stream_loop -1 -i ./media/demo.mp4 -c copy -f rtsp rtsp://localhost:8554/mystream
```

# 3. receive stream

``` bash
ffmpeg -re -stream_loop -1 -i ./media/demo.mp4 -c copy -f rtsp rtsp://localhost:8554/stream
```
not working? install `ffmpeg`
``` bash
sudo ffmpeg
```


ffmpeg -re -stream_loop -1 -i ./media/demo.mp4 -c copy -f rtsp rtsp://192.168.1.204:8554/stream


ffmpeg \
-re \
-stream_loop -1 \
-i ./media/demo.mp4 \
-vf format=nv12 \
-c:v libx264 \
-preset ultrafast \
-tune zerolatency \
-f rtsp \
rtsp://localhost:8554/mystream



ffmpeg \
-f rawvideo \
-pixel_format bgr24 \
-video_size 640x480 \
-framerate {self.fps} \
-i /dev/zero \
-vf format=nv12 \
-c:v libx264 \
-preset ultrafast \
-tune zerolatency \
-f rtsp \
rtsp://localhost:8554/mystream


