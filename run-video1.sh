# ffmpeg -re -stream_loop -1 -i ./media/demo.mp4 -c copy -f rtsp rtsp://192.168.1.204:8554/stream

ffmpeg -re -stream_loop -1 -i ./media/demo.mp4 -f rtsp rtsp://192.168.1.204:8554/stream
