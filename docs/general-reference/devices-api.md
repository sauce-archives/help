---
title: Devices REST API
layout: en
permalink: docs/general-reference/devices/api
---


Base URL:

{% highlight javascript %}
https://app.testobject.com:443/api/rest/devices/v1
{% endhighlight %}

Request headers:

{% highlight javascript %}
Content-Type: application/json
{% endhighlight %}


<h3 id="devices">Devices</h3>

<h4 id="read-device-descriptors">Read Device Descriptors</h4>

Returns all device descriptors.

{% highlight javascript %}
GET /devices
{% endhighlight %}

Response:

{% highlight javascript %}
[
	{
		id: "Fairphone_real",
		name: "Fairphone",
		...
	},
	...
]
{% endhighlight %}


<h4 id="read-available-devices">Read Available Devices</h4>

Returns the IDs of the devices which are currently available.

{% highlight javascript %}
GET /devices/available
{% endhighlight %}

Response:

{% highlight javascript %}
[
	"Fairphone_real",
	...
]
{% endhighlight %}


<h4 id="open-device">Open Device</h4>

Allocates a device with the given ID and creates a new device session. This request has to be made with basic authentication where the username is your username and the password is your API key.

{% highlight javascript %}
POST /devices/open?id={:deviceId}
{% endhighlight %}

Basic auth:

{% highlight javascript %}
username={:yourUserName}
password={:yourApiKey}
{% endhighlight %}

Response:

{% highlight javascript %}
{
	status: "SUCCESS" | "ERROR",
	error: "DEVICE_NOT_AVAILABLE" | "INTERNAL_ERROR",
	deviceSessionId: "c17b17a4-9eef-11e5-bcce-15f268a460b9"
}
{% endhighlight %}


<h3 id="devices">Device Sessions</h3>

Once you created a device session you can use the following methods to interact with the device.


<h4 id="read-session-descriptor">Read Session Descriptor</h4>

Returns the device session descriptor containing the device properties required to render the device.

{% highlight javascript %}
GET /sessions/{:deviceSessionId}
{% endhighlight %}

Response:

{% highlight javascript %}
{
	status: "SUCCESS" | "ERROR",
	error: "DEVICE_SESSION_NOT_FOUND",
	deviceSessionDescriptor: {
		resolutionWidth: 540,
		resolutionHeight: 960,
		orientation: "PORTRAIT" | "LANDSCAPE",
		hasOnScreenButtons: true | false
		viewOnly: true | false
	}
}
{% endhighlight %}


<h4 id="close-device">Close Device</h4>

Ends the device session.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/close
{% endhighlight %}


<!-- 
<h4 id="install-app">Install App</h4>

Installs a previously uploaded app.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/apps/{:externalAppVersionId}/install
{% endhighlight %}


<h4 id="restart-app">Restart App</h4>

Restarts the app with the given ID.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/apps/{:externalAppVersionId}/restart
{% endhighlight %}


<h4 id="push-file">Push File</h4>

Pushes a previously uploaded file to the device.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/files/{:fileId}/push
{% endhighlight %}
-->


<h4 id="open-url">Open URL</h4>

Convenience method to open the given URL. This requires the Chrome browser to be installed on the device. 

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/openUrl
{% endhighlight %}

Request body:

{% highlight javascript %}
https://domain-to-open.com
{% endhighlight %}


<!-- 
<h4 id="paste-content">Paste Content</h4>

Pastes the given text into the device.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/paste
{% endhighlight %}

Request body:

{% highlight javascript %}
This is the text I wish to paste into the device.
{% endhighlight %}
-->


<h4 id="get-orientation">Get Orientation</h4>

Returns the current orientation of the device.

{% highlight javascript %}
GET /sessions/{:deviceSessionId}/orientation
{% endhighlight %}

Response:

{% highlight javascript %}
PORTRAIT | LANDSCAPE
{% endhighlight %}


<h4 id="set-orientation">Set Orientation</h4>

Rotates the device to the given orientation.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/orientation
{% endhighlight %}

Request body:

{% highlight javascript %}
PORTRAIT | LANDSCAPE
{% endhighlight %}

Response:

{% highlight javascript %}
PORTRAIT | LANDSCAPE
{% endhighlight %}


<!--
<h4 id="set-gps-coordinates">Set GPS Coordinates</h4>

Sets the GPS coordinates.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/gps/coordinates
{% endhighlight %}

Request body:

{% highlight javascript %}
{
	lat: "52.51628",
	lon: "13.37772"
}
{% endhighlight %}

Response:

{% highlight javascript %}
{
	lat: "52.51628",
	lon: "13.37772"
}
{% endhighlight %}


<h4 id="adb-shell-command">Execute ADB Shell Command</h4>

Executes the given ADB command. "adb shell" will automatically be prepended. Send "input text 'abc'" to execute the command "adb shell input text 'abc'".

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/adb
{% endhighlight %}

Request body:

{% highlight javascript %}
input text 'abc'
{% endhighlight %}


<h4 id="get-locales">Get Locales</h4>

Returns all locales of the device.

{% highlight javascript %}
GET /sessions/{:deviceSessionId}/locales
{% endhighlight %}

Response:

{% highlight javascript %}
[
	{
		"country": "DE",
		"language": "de",
		"label": "German"
	},
	...
]
{% endhighlight %}


<h4 id="set-locales">Set Locale</h4>

Sets the given locale.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/locales/{:locale}/set
{% endhighlight %}

Request body:

{% highlight javascript %}
DE
{% endhighlight %}

Response:

{% highlight javascript %}
{
	"country": "DE",
	"language": "de",
	"label": "German"
}
{% endhighlight %}


<h4 id="disable-animations">Disable Animations</h4>

Disables animations.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/animations/disable
{% endhighlight %}


<h4 id="enable-animations">Enable Animations</h4>

Enables animations.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/animations/enable
{% endhighlight %}


<h4 id="google-account">Display Google Account Settings</h4>

Convenience method to open the Google Account settings.

{% highlight javascript %}
POST /sessions/{:deviceSessionId}/googleAccount
{% endhighlight %}
-->
