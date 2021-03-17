.\system\php.exe -n -d extension=.\system\php_mbstring.dll -f .\system\SANITISEPHP.php "%~nx0" && pause
::set chaine=_CAMESCOPE_out
set chaine=COUVERTURE_
::for %%1 in ("*.mp4") do ffmpeg -i %%1 -s 720x576 -threads auto -c:v libx264 -b 2000k -r 25  -ab 448k -ar 48000 "newfiles\%chaine%%%~n1.MP4"
::for %%1 in ("*.avi") do ffmpeg -i %%1 -strict -2 -c:v libx264 -crf 19 -preset slow -c:a aac -b:a 192k -ac 2 "newfiles\%chaine%%%~n1.avi"
::ffmpeg -i %1 -s 720x576 -threads auto -c:v libx264 -b 2000k -r 25  -ab 448k -ar 48000 "%~n1%chaine%.MP4"

::md %~n1
:pause
::ffmpeg -i %1 -vf fps=1/15 img%03d.jpg
:: toutes les 15 secondes 1/15
::ffmpeg -i %1   -s 1280x720 -qscale:v 2 -vf fps=1/5  %~n1\filename%%03d.jpg
::ffmpeg -i %1   -s 1280x720 -qscale:v 2 -vf "select='eq(pict_type,PICT_TYPE_I)'" -vsync vfr   %~n1\%~n1_%%04d.jpg

::i_view32.exe  %1 /convert "%chaine%%~n1.jpg"
::i_view32.exe  %1 /convert "%chaine%%~n1.jpg"  /page=2
::i_view32.exe  %1 /convert "%chaine%%~n1.jpg" /extract=(%~n1,jpg)

::Explorer.exe %~n1
::for %%1 in ("*.PDF") do  i_view32.exe  %%1 /convert "%chaine%%%~n1.jpg"  /extract=(%%~n1,jpg)
::for %%1 in ("*.PDF") do  i_view32.exe  %%1 /convert "%%~n1.jpg"  
pause
::for /R  %%I in (*.PDF) do (

for   %%I in (*.djvu) do (
IF EXIST %%~nI.jpg (
    echo "EXIST"
) ELSE (
   c:\convert\i_view32.exe  %%I /convert "%%~nI.jpg"  
)
)



for   %%I in (*.pdf) do (
IF EXIST %%~nI.jpg (
    echo "EXIST"
) ELSE (
   c:\convert\i_view32.exe  %%I /convert "%%~nI.jpg"  
)
)
pause
type CORPS5.txt > ###BOOKAWESOMEPDFDJVU5.html

pause








for   %%a  in (*.jpg) do (
IF EXIST %%~na.djvu (
   echo ^<div class="profile-pic"^>^<img data-action="zoom" class=" lazyloaded" data-tags="" data-src="%%~na.jpg" src="%%~na.jpg" title="%%~na.jpg" style="max-width: 199px;"^> ^<div class="edit" style="display: block ; z-index: 11;"^>^<a href="%%~na.djvu" target="_blank"^>^<i class="fa fa-1" style="color: white; display: none;" aria-hidden="true"^>^</i^>^</a^>"&nbsp;&nbsp;"^<a href="#" ^>^<i class="fa fa-2" style="color: white; display: none;" aria-hidden="true"^>^</i^>^</a^>^</div^>^</div^>  >> ###BOOKAWESOMEPDFDJVU5.html
) ELSE (
    echo ^<div class="profile-pic"^>^<img data-action="zoom" class=" lazyloaded" data-tags="" data-src="%%~na.jpg" src="%%~na.jpg" title="%%~na.jpg" style="max-width: 199px;"^> ^<div class="edit" style="display: block ; z-index: 11;"^>^<a href="%%~na.pdf" target="_blank"^>^<i class="fa fa-1" style="color: white; display: none;" aria-hidden="true"^>^</i^>^</a^>"&nbsp;&nbsp;"^<a href="#" ^>^<i class="fa fa-2" style="color: white; display: none;" aria-hidden="true"^>^</i^>^</a^>^</div^>^</div^>  >> ###BOOKAWESOMEPDFDJVU5.html
)
)








::for %%i in (*.jpg) do >nul FINDSTR /C:"LUT" "%%~i" || echo "%%i"
::Echo.Hello worl1d | findstr /C:"world">nul && (    Echo.TRUE) || (   Echo.FALSE)
echo ^</html^> >>###BOOKAWESOMEPDFDJVU5.html
pause

start "" "###BOOKAWESOMEPDFDJVU5.html"
