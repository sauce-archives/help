---
title: Locator Methods
layout: en
permalink: docs/api/locator/
alias: docs/references/scripting-api/locator/
---

<h3 id="find">find( targetLocator , [timeout] , [recordedImage])</h3>
<p>rotate the device to landscape view</p>
<p><ul>
	<li>
		<strong>targetLocator</strong>
		<div>Type: Locator</div>
		<em>the locator to search for on the screen</em>
	</li>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds to wait until the targetLocator appears, if not set timeout is by default 60 seconds</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
	<li>
		<strong>Returns</strong>
		<div>Type: BoxLocator</div>
		<em>locator which contains the size and position of the targetLocator on the current Screen</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}find(image(25).before().box(129, 469, 221, 69), 60, image(25)){% endhighlight %}
</p>

<h3 id="waitVanish">waitVanish( targetLocator , [timeout] , [recordedImage] )</h3>
<p>wait until the targetLocator vanishes from the screen, fails if the targetLocator is still visible after the given timeout</p>
<p><ul>
	<li>
		<strong>targetLocator</strong>
		<div>Type: Locator</div>
		<em>the locator which should disappear from the screen</em>
	</li>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds until the targetLocator must disappear, if not set timeout is by default 60 seconds</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}waitVanish(image(26).before().box(129,469,221,69), 82.3, image(26)){% endhighlight %}
</p>

<h3 id="waitAppear">waitAppear( targetLocator , [timeout] , [recordedImage] )</h3>
<p>wait until the targetLocator appears on the screen, fails if the targetLocator doesn't appear after the given timeout</p>
<p><ul>
	<li>
		<strong>targetLocator</strong>
		<div>Type: Locator</div>
		<em>the locator which should appear on the screen</em>
	</li>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds until the targetLocator must appear, if not set timeout is by default 60 seconds</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}waitAppear(image(26).after().box(129,469,221,69), 82.3, image(26)){% endhighlight %}
</p>

<h3 id="waitUpdates">waitUpdates( [timeout] , [recordedImage] )</h3>
  wait until screen stops changing. Usually inserted automatically during recording but can be added manually to improve stability of the test.  
<p><ul>
	<li>
		<strong>timeout</strong>
		<div>Type: Numeric</div>
		<em>time in seconds during which screen should stop changing, if not set timeout is by default 60 seconds</em>
	</li>
	<li>
		<strong>recordedImage</strong>
		<div>Type: Image</div>
		<em>reference to the screenshots taken during recording</em>
	</li>
</ul></p>
<p>
<strong>Example:</strong>
{% highlight js %}waitUpdates(60){% endhighlight %}
</p>
  In some cases application requires some time to update the screen between actions.  
  For example when user needs to login he first needs to click "Login" button, then type his credentials and press "Confirm" button.  
  If application takes some time to load login form then system might start typing credentials when screen is not ready yet.  
  **waitUpdates()** ensures that screen is ready before next action can be performed.  
  If screen still changes next action will not be performed until there are no more updates except for really 
  small ones to ignore blinking cursors.  
  If page is supposed to change all the time because of animation, then timeout can be decreased.  
  When to use:  
  - System starts typing when textfield is not yet on the screen.  
  - Normally system clicks the button as soon as it finds it on the screen. In some cases all elements on the screen has to be loaded first.  
  
  Usually **waitUpdates()** are inserted during the recording when system detects that an action was followed by a lot of screen changes.  
  Load speed characteristics of web applications can vary from execution to execution so in some cases **waitUpdates()** 
  might not be inserted automatically because the page loaded fast during recording but loads slowly during some of the replays.  
  In this case **waitUpdates()** should be inserted manually.  
  Read more about <a href="docs/guides/bulletproof-tests">making your tests bulletproof</a>.
  
