---
title: Storage REST API
layout: en
permalink: docs/api/storage
---


Use the following command to upload your app file.

{% highlight bash %}
curl -u "your_username:your_api_key" -X POST https://app.testobject.com:443/api/storage/upload -H "Content-Type: application/octet-stream" --data-binary @your_app.apk
{% endhighlight %}

The response of the curl upload command will be the ID of the newly uploaded app. If you're working with Appium you can use it to <a href="/docs/api/appium">update the appVersionId</a> of your suite.


Optionally, you can send the following header parameters:

<h5>App-DisplayName</h5>

*Optional*

Your custom display name

Usage example:

{% highlight bash %}
curl -u "your_username:your_api_key" -X POST https://app.testobject.com:443/api/storage/upload -H "Content-Type: application/octet-stream" -H "App-DisplayName: yourCustomDisplayName" --data-binary @your_app.apk
{% endhighlight %}

<h5>App-Identifier</h5>

*Optional*

Your custom unique identifier for your app

Usage example:

{% highlight bash %}
curl -u "your_username:your_api_key" -X POST https://app.testobject.com:443/api/storage/upload -H "Content-Type: application/octet-stream" -H "App-Identifier: identifier_for_your_app" --data-binary @your_app.apk
{% endhighlight %}

By providing a custom identifier you can also check if an app was already uploaded and prevent duplicate uploads.

First, get all apps for a given MD5:

{% highlight bash %}
curl -u "your_username:your_api_key" -X GET https://app.testobject.com:443/api/storage/app?appIdentifier=MD5_hash_of_your_app
{% endhighlight %}

Only if the call returns an empty JSON array, start uploading the file:

{% highlight bash %}
curl -u "your_username:your_api_key" -X POST https://app.testobject.com:443/api/storage/upload -H "Content-Type: application/octet-stream" -H "App-Identifier: MD5_hash_of_your_app" --data-binary @your_app.apk
{% endhighlight %}
