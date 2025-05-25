# DLNA-web

DLNA-web is an HTML5 video player. It search for DLNA
servers on local network, displays a list of folders,
and videos. Click on a video to start playing.

We use DLNA-web on a big (75") touch-screen in the lab.
It use Ajax to retreive DLNA ressources. This allows
browsing files while video is playing. 

## Warning
`fs.dlna` works only with Python 3.8. Right now (2025),
this version is quite old. To be able to run this on a
recent OS you can use UV Python install or simply use
the docker version. Simply set the SERVER_PATH in the
`compose.yaml` file, and run `docker compose up -d`.
This will build the image and run it in the background.


## Notes
Web browser only supports mp4 and webm for video rendering,
so you should expect weirds stuffs if you play something
else.
   

 ![DLNA-web](./screenshots/shot1.jpg)

    
## Install

    pip install -r requirements.txt (--user if needed)

## Configuration
Edit src/config.py to setup the DLNA path to search
for video.
    
    
## Run

    python src/app.py

Open your browser at http://localhost:7777/


## Customise
You can customise the player for your needs, just edit
static/index.html & static/site.css. The Python code is
just an DLNA to REST anyways, so just need to edit statics
files. 
