---
title: File download on emulator
layout: en
permalink: docs/guides/file-download/
---

<h3>File download steps</h3>
<p>Some applications require files to be present on SD card which don't come with application itself.</p>
<p>The feature to install arbitrary files as dependencies will be implemented but until it's released there is a possibility to use a workaround althought with some limitations.</p>
<p>
Our scripting API allows to execute arbitrary commands on Android devices which we'll use to create steps to download files to any location on device:

{% highlight javascript %} 
var url = 'http://help.testobject.com/attachments/guide/example.zip'; // file to download
executeShellCommand('am start -a android.intent.action.VIEW -d ' + url) // download command
executeShellCommand('mkdir -p /sdcard/MyApp/Files') // create destincation folder
executeShellCommand('mv /sdcard/Download/example.zip /sdcard/MyApp/Files') // copy the file to destination

launchDefaultApp()
{% endhighlight %}
</p>

<p>
If you put this script in front of your test it will download required file before starting the application.
</p>
<p>This is how this script looks like in our application:</p>
<img src="/img/guides/file-download.png" />
<p>
This approach has severe limations:<br>
- File has to be publicly available (although it's possible to modify it to include login steps using visual editor)<br>
- If file can be displayed in browser it will not be downloaded<br>
</p>
<p>Please note that we are working on allowing to put files in filesystem natively using web interface of CONTINOUS. This is just a workaround.</p>
