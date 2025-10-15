REM https://github.com/fastandphinneas/Glomble-Android-App
REM Glomble App for Android (Mobile Optimized, TV version available from repo)
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
  IF IS_IN("glomble.com", LINK$) > 0 THEN HTML.LOAD.URL LINK$
  IF IS_IN("glomble.com", LINK$) < 1 THEN BROWSE LINK$
 ENDIF
 PAUSE 1000
UNTIL 0
ENDIF
ONERROR:
! Back Key throws an error because of some of the above code. This works as a temporary fix, but could be useful to keep
GOTO start
