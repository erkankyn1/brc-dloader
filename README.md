# BigBlueButton Record Downloader

When you want to download your presentation in bigbluebutton, you can use this tool. 

### Features
* Multiple record download.
* Download record by link. 


### Explanation

You can use this tool when you want to download your presentation in Bigbluebutton. With this tool, you can download all Bigbluebutton presentations at once.

Why did I develop this tool?

When I wanted to download my presentations on Bigbluebutton, I saw that there was no download button on the web page. Later, when I wanted to download with a right-click on the video from the browser, a file with the webm extension was downloaded, but there was no meeting voice records in this file. I was solving this problem before as follows;

If you start a meeting recording on BBB, the recordings are stored in the server by creating a specific folder structure. These folders are usually the same name as your meeting id. In the folder where the meeting recording is located, there are two files named deskshare.webm and webcams.webm. Your audio recordings are on webcams.webm and your screen sharing is on deskshare.webm. Tools such as ffmpeg are used to combine these two records into one file. I wanted to write a bash script instead of doing these operations one by one. After I wrote this tool, I wanted to download all the records in my list in bulk. In this case, I have developed a simple tool with two features.
