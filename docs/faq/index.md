---
title: FAQ
layout: en
permalink: docs/faq/
alias: docs/FAQ/
---

<h6 id="faq_1"><b>Q:</b> I'm using the <a href="/docs/references/scripting-api/sensor#setGPS" target="_blank" target="setGPS() reference">setGPS()</a> method, but my app doesn't get the location.</h6>

<b>A:</b> To simulate the location, we use Android's test location providers.  
Make sure that your app has the following permission:  

{% highlight js %} <uses-permission android:name="android.permission.ACCESS_MOCK_LOCATION" /> {% endhighlight %}

<hr>

<h6 id="faq_2"><b>Q:</b> How can I change the Locale of a device?</h6>

<b>A:</b> <b><i>Locale</i></b> represents a language/country/variant combination.  
Locales are used to alter the presentation of information such as numbers or dates to suit the conventions in the region they describe. <small>(<a href="http://developer.android.com/reference/java/util/Locale.html" target="_blank" target="Locale">Further reading</a>)</small>  
  

To change the device's locale, add the following line to your script:  
{% highlight js %} executeShellCommand('am broadcast -a com.android.intent.action.SET_LOCALE --es com.android.intent.extra.LOCALE en') {% endhighlight %}  <small>(<a href="/docs/api/phone/#executeShellCommand" target="_blank" target="executeShellCommand() reference">more about executeShellCommand()</a>)</small>  

Just replace the Locale code ('en' in the example above) with the desired Locale.  
 <a href="http://developer.android.com/reference/java/util/Locale.html#CANADA" target="_blank" target="Locale codes">a list</a> of Locale codes is available at the official Android Developer website. 