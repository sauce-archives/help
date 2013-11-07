---
title: File download on emulator
layout: en
permalink: docs/guides/file-download/
---

<h3>File download steps</h3>
<p>Some applications require certain native files to be present on the device. A feature installing arbitrary files as dependencies will be implemented but until it's released there is a workaround.</p>
<p>
Our scripting API allows executing arbitrary commands on Android devices. We will use this feature to create steps to download files to any location on the device:

{% highlight javascript %} 
var url = 'http://help.testobject.com/attachments/guide/example.zip'; // file to download
executeShellCommand('am start -a android.intent.action.VIEW -d ' + url) // download command
executeShellCommand('mkdir -p /sdcard/MyApp/Files') // create destination folder
executeShellCommand('mv /sdcard/Download/example.zip /sdcard/MyApp/Files') // copy the file to the destination

launchDefaultApp()
{% endhighlight %}
</p>

<p>
If you place this script before your test it will download the specified files before the application starts.
</p>
<p>This is how this script looks like in our application:</p>
<img src="/img/guides/file-download.png" />
<p>
This approach has severe limitations:<br>
- Files have to be publicly available (although it's possible to modify it to include login steps using the visual editor)<br>
- If the files can be displayed in a browser it will not be downloaded<br>
</p>
<p>Please note that we are working on a way to upload files to the file system natively using the web interface of TestObject. This is just a workaround.</p>

