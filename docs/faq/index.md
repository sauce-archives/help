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
 <a href="http://developer.android.com/reference/java/util/Locale.html#CANADA" target="_blank" target="Locale codes">A list</a> of Locale codes is available at the official Android Developer website. 

<hr>

<h6 id="faq_3"><b>Q:</b> Is there a way to have a setUp() and a tearDown() a la xUnit, without having to duplicate this in every test?</h6>

<b>A:</b> Yes, you can setup specific tests and run them with the <a href="/docs/api/scripting" target="_blank" target="runScript() reference">runScript()</a> command. Therefore you don't have duplicated commands in differenct tests.

Example:  
{% highlight js %}
runScript(1) // setUp();
launchDefaultApp()
...
{% endhighlight %}

<hr>

<h6 id="faq_4"><b>Q:</b> Can I adjust the time of the emulators?</h6>

<b>A:</b> Sure, you can change the time of our emulators by adding this command to your script: 

{% highlight js %}executeShellCommand('adb shell date -s "{time}"'){% endhighlight %}

Where {time} is a representation of the current time in the following structure:

{% highlight js %}YYYYMMDD.hhmmss{% endhighlight %}

To format a given JavaScript date string just use this <a href="http://jsfiddle.net/G5kEQ/64/" target="_blank" target="JavaScript format">JavaScript format</a> 

<hr>

<h6 id="faq_5"><b>Q:</b> What is the difference between ARM and Intel emulators? Should I test my app on both emulators?</h6>

<b>A:</b> The main difference between this emulators are the emulated CPU types. Most common for smartphones are ARM CPU’s but there are also some Intel devices. Most Android apps work on both types.  The Intel emulator is way faster so probably your app will run faster.

Yes we recommend to test your app on both emulators.
