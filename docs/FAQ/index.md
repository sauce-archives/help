---
title: FAQ
layout: en
permalink: docs/FAQ/
---

<h6 id="faq_1"><b>Q:</b>  I'm using <a href="/docs/references/scripting-api/sensor#setGPS" target="_blank" target="setGPS() reference">setGPS()</a>, but my app doesn't get the location.</h6>

<b>A:</b>  To simulate the location, we use Android's test location providers.  
Make sure that your app has the following permission:  

{% highlight js %} <uses-permission android:name="android.permission.ACCESS_MOCK_LOCATION" /> {% endhighlight %}