REM Android App for Glomble (Focused on TV compatibility)
url$ = "https://glomble.com/"
PAUSE 500
HTML.OPEN
start:
HTML.LOAD.URL url$
PAUSE 400
dl$ = ""
DO
 HTML.GET.DATALINK dl$
 PAUSE 300
 IF dl$ <> "" THEN
  LINK$=MID$(dl$, 5)
  id$=MID$(LINK$, 27)
  ! check type of link
  PAUSE 100
  html$ = "<html><head><style>"
  html$ = html$ + "body { margin:0; padding:0; height:100vh; background-image:url('https://glomble.com/static/videos/favico.png'); background-size:cover; background-position:center; background-repeat:no-repeat; display:flex; flex-direction:column; align-items:center; justify-content:center; }"
  html$ = html$ + "video { width:90vw; max-height:60vh; background:black; }"
  html$ = html$ + "button { margin-top:20px; padding:10px 30px; font-size:18px; }"
  html$ = html$ + "#imageBtn { position:absolute; top:20px; left:20px; width:50px; height:50px; z-index:9999; cursor:pointer; }"
  html$ = html$ + "</style></head><body>"
  html$ = html$ + "<a href='https://glomble.com'><img id='imageBtn' src='https://glomble.com/static/videos/favico.png'></a>"
  html$ = html$ + "<video id='myVid' src='https://media.glomble.com/uploads/video_files" + id$ + ".mp4' controls autoplay></video>"
  html$ = html$ + "<button onclick=\"document.getElementById('myVid').requestFullscreen()\">Fullscreen</button>"
  html$ = html$ + "</body></html>"
  IF IS_IN("glomble.com/videos", LINK$) > 0 THEN HTML.LOAD.STRING html$
  IF IS_IN("glomble.com/videos", LINK$) = 0 THEN HTML.LOAD.URL LINK$
 ENDIF
 PAUSE 1000
UNTIL 0
ENDIF
openhtml:
PAUSE 100
HTML.LOAD.URL MID$(dl$, 5)
