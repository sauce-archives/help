---
title: Making your tests bulletproof
layout: en
permalink: docs/guides/bulletproof-tests/
---

###Making your tests bulletproof
  
  Good test is the one that fails only when the application doesn't behave as expected.  
  A test which fails when an application is in fact operational quickly becomes ignored.  
  
  Why tests can be unreliable?  
  We strive to make creating a test as simple as possible - you press "Record" button, 
  interact with your application and we create a test based on your actions.  
  When you press "Replay" our system reconstructs your actions based on recorded steps.  
  
  Reconstructing actions has some challenges:  
  - We want the replay to be faster than the recording  
  - We want to accomodate for changing environment - a login screen was ready in 0.5 seconds during recoding, 
  but what if a server is under load? It might take longer.  
  - Some applications require whole screen to be ready, not just desired element.  

  We take care of this, but sometimes a test still needs adjustments if if fails in some cases.  

  Below are some tools and techniques that you can use to make sure your test executes reliably every time.  


####Waiting for locators
  Most of stability issues come from the time that an application needs to generate view for the user.  

  Lets look at screenshots below:  
<div class="side-by-side">
 	<img src="/img/guides/bulletproof-tests/theverge1.png" /> <img src="/img/guides/bulletproof-tests/theverge2.png" />
</div>

  First one was taken when page was loading and the second one after page was ready.  
  Imagine that the first step in your script after loading a starting page is clicking on the "Login" button:  

  <img src="/img/guides/bulletproof-tests/theverge-before.png">  
  
  During the replay the system will find the "Login" button as soon as it appears on the screen - in the left top corner and will click on it.  
  This can cause two problems - you will get a warning in a script report because the position was different from the one in recording -
  the person which recorded the test actually waited for the whole screen to load before clicking.  
  Second issue is that if clicks on "Login" button are handled by Javascript and it's is yet not loaded - the click will have no effect, 
  so the rest of the script fails.  
  

  **waitAppear** and **waitVanish** to the rescue!  
  Normally these functions are used to create test assertions and they will fail if certain element is
  not on application screen or still on it after it was supposed to be removed. What they also do is wait for elements, 
  which means that we can use it to make sure the screen is ready.  
 
  Lets say that the last thing that is loaded on the page is the "Install" button.  
  You can wait for it to appear by using **waitAppear** function:  

  <img src="/img/guides/bulletproof-tests/theverge-after.png">   

  Please refer to <a href="/docs/api/locator#waitAppear">waitAppear</a> reference for use and syntax.  

  **waitVanish** does exactly the opposite - it allows for script to continue only after certain element is gone from the application screen.  
  
####Wating for screen to load

  Another way to make sure the screen is ready is by using **waitUpdates** function.  
  When **waitUpdates** is called it starts monitoring changes on the application screen.  
  When the screen is loading it always changes, when it's done - it stops updating, hence the name **waitUpdates**.

  <img src="/img/guides/bulletproof-tests/theverge-waitUpdates.png">
 
  This approach is useful if you are not interested in any particular element but rather in general page readiness.  
  The common problem it solves is typing when a text field is not yet on the screen:   

  <img src="/img/guides/bulletproof-tests/testobject-cursor.png">  

  The script below will fail quite often:  

  <img src="/img/guides/bulletproof-tests/testobject-before.png">

  The problem here is that it might start typing before the page is loaded if server is under load or slow in general.  
  The easiest solution would be clicking on the text field before starting to type:  

  <img src="/img/guides/bulletproof-tests/testobject-click.png">


  To click on a text field the system would have to wait for it to appear first, so by the time **type** is issued text field will be ready.  
  It will also ensure that the field is focused.  

  But what if the purpose of a test step is to make sure that the field already has focus?  
  In this case a test needs to wait until page is ready.
  Inserting **waitUpdates** before typing will make sure that the page is fully loaded before typing can begin.

  <img src="/img/guides/bulletproof-tests/testobject-after.png">

####When to use **waitAppear**/**waitVanish** and when **waitUpdates**?
  **waitAppear**/**waitVanish** and **waitUpdates** can have similar purpose by ensuring that application is ready to continue to the next step.  
  In a lot of cases thay can be used interchangeably, so when to use each one?  
  **waitUpdates** is more generic and doesn't need any particular element to be defined, which makes it perfect for situations when the readiness of the page is defined by the lack of screen changes.  
  This approach however makes a test execution a bit slower - when an application screen stops updating **waitUpdates** needs 
  a couple of seconds to confirm that page is ready and it's not just a pause in loading.  
  Another issue are applications with constant animation. If an application screen constantly changes because of a banner for example, **waitUpdates** will stop only after timeout is reached.  
  **waitUpdates** is inserted automatically in your test during a recording when the system detects that an application took some time to get ready between steps and this approach works well in most cases.  
  **waitAppear**/**waitVanish** on the other hand is extremely fast as it scans an application screen constantly and goes to the next test step as soon as element appears on or vanishes from the screen.  
  This makes a test execution as fast as possible but requires manual input from the user as we can't determine which elements are actually relevant to the application.  
  If the execution speed is essential for your test you can reduce waiting time by replacing some or all of **waitUpdates** with **waitAppear**/**waitVanish**

####Adjusting timeouts
  We use timeouts to determine how long to wait for elements to appers/vanish before executing an action.  
  Functions that look for elements on the screen fail after **60** seconds by default if the element is not on the screen.  
  Sometimes however applications need more time, for example if they include some processing or downloading big files.  
  Increasing the timeout for **click**, **waitAppear**/**waitVanish** will make sure that test will not fail just because it needed more time for execution.  
  **waitUpdates** also has a timeout which limits the time that the system waits for an application screen to get ready. If an application needs more than **60** seconds 
  the timeout can be increased to make sure the test waits long enough.
