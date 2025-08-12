# rtsp-streamer (version 2025-08-12)
```
 ffmpeg -re -i ./media/demo.mp4 -c copy -rtsp_transport tcp -f rtsp rtsp://192.168.88.202:8554/mystream
```

# rtsp-streamer (version 2025-08-11)

ffmpeg -re -i ./media/demo.mp4 -c copy -f rtsp rtsp://192.168.88.202:8554/mystream

ffmpeg -re -i ./media/demo.mp4 -c copy -rtsp_transport tcp -f rtsp rtsp://192.168.88.202:8554/mystream


vlc rtsp://192.168.88.202:8554/mystream

# rtsp-streamer (version 2025-05-21)
## SERVE:
ffmpeg -re -stream_loop -1 -i ./media/demo.mp4 -c copy -f rtsp rtsp://192.168.1.161:8554/stream
## RECEIVE:
ffplay rtsp://192.168.1.161:8554/stream


 
# rtsp-streamer OLD

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


export streamsrv=<adres_ip_lub_hostname_serwera>
export streamsrv=192.168.1.204

 Could find no file with path './frame%03d.png' and index in the range 0-4
./frame%03d.png: No such file or directory

/mnt/c/repos/agrobotspl/agro-datasets/frames_timer

ffmpeg -re -f image2 -framerate 25 -i /mnt/c/repos/agrobotspl/agro-datasets/frames_timer/frame%03d.png \
    -c:v libx264 -preset ultrafast -tune zerolatency -f rtsp rtsp://localhost:8554/mystream

ffmpeg -re -f image2 -framerate 25 -i /mnt/c/repos/agrobotspl/agro-datasets/frames_timer/frame%03d.jpg \
    -c:v libx264 -preset ultrafast -tune zerolatency -f rtsp rtsp://"$streamsrv":8554/mystream



``` yaml
version: '3.8'

services:
  rtsp-simple-server:
    image: bluenviron/mediamtx
    container_name: rtsp-simple-server
    environment:
      RTSP_PROTOCOLS: tcp
    ports:
      - "8554:8554"
      - "1935:1935"
      - "8888:8888"
    stdin_open: true
    tty: true
    restart: unless-stopped

```
