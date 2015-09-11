---
title: Quality Report - FAQ
layout: en
permalink: docs/testing-tools/qr-faq/
---

<h3 id="faq">Questions asked...</h3>

<br>
<h5> Q: What kind of bugs will I find?</h5>
A: There is a long list of potential problems that can be discovered either with the Install&Launch or the Stress Test. The most common problems are NullPointerExceptions, OutOfBoundExceptions, InsufficientStorage- and OutOfMemoryExceptions.

<br>
<h5> Q: What is the difference between "ERRORS" and "BUGS" in the Quality Report?</h5>
A: "ERRORS" are problems that we found automatically while running the Install&Launch and Stress test. They're good indicators for potential problems. "BUGS" on the other hand, can only be opened by yourself. In case we found an error, you can review it and decide if it can be ignored or if it is a real problem and open a bug for it.

<br>
<h5>Q: My app requires a login, and the Stress Test can't get through.</h5>
A: Currently, we don't provide a solution for this. The MonkeyRunner can't pass a login screen at the moment. If you want to perform a Stress Test anyway, you can do so in the manual testing feature. Go to manual, select a device, manually login to your app, and then select the MonkeyRunner feature in the left menu.
