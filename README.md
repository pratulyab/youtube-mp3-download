# Download Song From [Youtube](https://www.youtube.com)
<br><hr><br>
- Python script to download mp3 files from youtube
<br>
- <b>This script requests [youtube-mp3.org](http://www.youtube-mp3.org) to extract the mp3 file from a youtube video, as chosen by the user.</b>
<br>
- It downloads and saves the .mp3 file:
	- with user specified filename (--f=""), otherwise named as the video is
	- to the user specified directory path (--p=""), otherwise to the directory containing this script

<hr><br>
## Screenshots
### Setting alias using shell script and running script using alias
- <b>It is imporant to run the script using 'source' command for the alias expansion to work in current session.</b>
- ![](/screenshots/alias.png)
- To set alias permanently, i.e. to add the alias command in .bash_profile or .bashrc:
	- use -p option
	- source setalias.sh -p

### Running script with path and file options
- ![Running script with path and file options](/screenshots/pf.png)

### Running script with only path option
- ![Running script with only path option](/screenshots/p.png)
- Filename is by default set to the video's title
