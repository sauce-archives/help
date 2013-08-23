---
title: Phone Methods
layout: en
permalink: docs/api/phone/
alias: docs/references/scripting-api/phone/
---

<h3 id="receiveCall">receiveCall( phoneNumber , [ recordedImage ] )</h3>
<p>call the phone with the given number</p>
<p><ul>
	<li>
		<strong>phoneNumber</strong>
		<div>Type: String</div>
		<em>the number which should appear on the screen</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}receiveCall('12345', image(19)){% endhighlight %}
</p>

<h3 id="hangupCall">hangupCall( phoneNumber , [ recordedImage ] )</h3>
<p>stop the call with the given number</p>
<p><ul>
	<li>
		<strong>phoneNumber</strong>
		<div>Type: String</div>
		<em>the number of the call which should be stopped</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}hangupCall('12345', image(19)){% endhighlight %}
</p>

<h3 id="receiveSMS">receiveSMS( message, phoneNumber , [ recordedImage ] )</h3>
<p>send a message to the phone from the given number</p>
<p><ul>
	<li>
		<strong>message</strong>
		<div>Type: String</div>
		<em>the message part for the sms</em>
	</li>
	<li>
		<strong>phoneNumber</strong>
		<div>Type: String</div>
		<em>sender number for the sms</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}receiveSMS('sample message', '1234', image(22)){% endhighlight %}
</p>

<h3 id="executeShellCommand">executeShellCommand( command, [ recordedImage ] )</h3>
<p>execute the given (adb) command on the device</p>
<p><ul>
	<li>
		<strong>command</strong>
		<div>Type: String</div>
		<em>the command to be executed</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}executeShellCommand('pm install test.apk', image(23)){% endhighlight %}
</p>
