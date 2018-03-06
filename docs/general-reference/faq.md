---
title: FAQ
layout: en
permalink: docs/general-reference/faq/
alias: [/docs/questions-and-answers/faq-security/, /docs/questions-and-answers/faq-devices/, /docs/FAQ/]
---
<ul>
	<li> <a href="#FAQ-Devices">Devices</a> </li>
	<li> <a href="#FAQ-Security">Security</a> </li>
	<li> <a href="#FAQ-Pricing">Pricing</a> </li>
    <li> <a href="#FAQ-Technical">Technical</a></li>
</ul>

<h3 id="FAQ-Devices">FAQ-Devices</h3>

<li><a href="#are-real-devices-real">How real are the real devices?</a></li>
<li><a href="#top-lists-by-country">What are the device top lists by country tell me and how reliable are they?</a></li>
<li><a href="#anomaly-top-lists">The devices in your top lists do not represent device distrubution in my user base. Why?</a></li>
<li><a href="#latest-devices">How long does it take until I can test on the latest devices?</a></li>
<li><a href="#device-missing">You don't have the device that I need. Can you get it for me?</a></li>
<li><a href="#device-camera">Is it possible to test the camera behavior using your devices?</a></li>
<li><a href="#push-notifications">Is it possible to test push notifications?</a></li>

<h4 id="are-real-devices-real">How real are the real devices?</h4>
The devices at TestObject are real, physical devices. They are standard, commercially available devices and not modified or rooted. TestObject uses virtual networking computer (VNC) to transmit mouse and keyboard events on the devices. The VNC client on the devices relays back the graphical screen of the devices. (See also: <a href="/docs/general-reference/devices/#real-devices-how-it-works" target="_blank">Real Devices: How It Works</a>)  

<h4 id="top-lists-by-country">What does the top device lists by country tell me, and how reliable are they?</h4>
The top lists indicate the ten most common devices by country. We gather information from an external provider who analyses mobile web traffic data from thousands of websites worldwide. The lists, therefore, should be quite reliable. A potential failure source is that, by using the indicator "web traffic" for device destribution numbers, high-end devices and tablets might be overrepresented. Older and low-cost devices often have a smaller screen and a poorer performance and therefore are less used for surfing the web than top devices. This is why the indicator "web-traffic" might underrepresent the overall distribution of these devices.

<h4 id="anomaly-top-lists">The devices in your top list do not coincide with top devices in my user base. Why?</h4>
When you compare the most popular devices of your users with our top lists you probably will see differences. A reason for this might be that our lists represent all mobile users whereas the users of your app(s) may differ in certain aspects from the overall population of mobile users. For example, a food recipe app probably attracts a different user group than an outdoor navigation app and these user groups probably also prefer different device models.

<h4 id="latest-devices">How long does it take until I can test on the latest devices at TestObject?</h4>
We try to implement new popular devices really quickly. Usually, we can provide new models three weeks after they are launched in Europe.

<h4 id="device-missing">You don't have the device that I need. Can you get it for me?</h4>
Generally, yes. If the model you are looking for is not in our pool yet you can request it. Click on the link "device request" below "Search devices" in the device selector. When the requested model aligns with our overall purchasing strategy, we'll get it for you.

<h4 id="device-camera">Is it possible to test the camera behaviour using your devices?</h4>
Yes, of course it is possible to test the camera behaviour on our devices. In front of our cameras are nice TestObject Logos ;-). You should see something like this through the camera:
<img class="center shadow" src="/img/faq/camera_view.png">

<h4 id="push-notifications">Is it possible to test push notifications?</h4>
Testing push notifications on TestObject depends on whether you are testing for Android or iOS. For iOS devices, it is currently not possible to test push notifications. This is because we must resign your application in order to install it on our real devices. For Android, there are no such issues, and it will be possible to test notifications.

<h3 id="FAQ-Security">FAQ-Security</h3>
<li><a href="#data-privacy">Is my app safe in the TestObject cloud?</a></li>
<li><a href="#data-protection">Can other users acces my data?</a></li>

<h4 id="data-privacy">Is my app safe in the TestObject cloud?</h4>
The TestObject servers are located in Germany at certified data centers. The communication is SSL secured. We try to ensure as much safety as a cloud service can provide. TestObject will never abuse your data, and we <a href="http://testobject.com/privacy" target="_blank">respect your data privacy</a> at all times. For very high security requirements we also provide a <a href="http://testobject.com/enterprise" target="_blank">private cloud solution</a>.

<h4 id="data-protection">Can other users acces my data?</h4>
It is of great importance for us to make sure that no other user can see or access your data. This is why we clean up the devices after each session. In detail we:
<ul>
<li>Uninstall all user apps</li>
<li>Delete browser data</li>
<li>Clear the SD card</li>
<li>Clear all accounts whenever allowed by the OS (e.g., Google Play, Twitter, etc.)</li>
<li>Finally, we automatically check if the clean-up was successful and block the device for other users if data has not been removed properly.</li>
</ul>

<h3 id="FAQ-Pricing">FAQ-Pricing</h3>
<li><a href="#fair-use">What does fair use mean?</a></li>
<li><a href="#manual-auto">I want to test manually and automatically.Do I need to purchase a plan for each feature?</li>
<li><a href="#concurrent-run">What are concurrent test runs?</a></li>
<li><a href="#upgrade-policy">Can I upgrade and downgrade plans at any time?</a></li>
<li><a href="#auto-renewed">Are all plans auto-renewed?</a></li>
<li><a href="#payment-methods">Which payment methods do you accept?</a></li>
<li><a href="#invoice">Will I receive an invoice?</a></li>

<h4 id="fair-use">What does fair use mean?</h4>
We want to ensure that no single user blocks devices permanently for other TestObject users. Therefore we implemented a fair use policy, which is a time limitation on daily usage. The limit varies depending on feature and plan:
<ul>
<li>Manual Testing: 1 hour average testing time per user per day</li>
<li>Automated Testing - Starter: 5 hours testing time per day (accumulated device time)</li>
<li>Automated Testing - Advanced: 20 hours testing time per day (accumulated device time)</li>
</ul>

<h4 id="manual-auto">I want to test manually and automatically.Do I need to purchase a plan for each feature?</h4>
If you want to test manually and automatically, you'll need a to subscribe to two plans, one for each feature. We distinguish between the features to make sure that you only pay for what you really use. The manual and automated plans are completely separate from each other. You can combine any manual with any automated plan. Down- or upgrading one plan will not affect the other.</p>

<h4 id="concurrent-run">What are concurrent test runs?</h4>
The concurrent test run limitation applies to the Automated Testing feature. It tells you on how many devices your test scripts will be executed in parallel.

<h4 id="upgrade-policy">Can I upgrade and downgrade plans at any time?</h4>
You can upgrade your plan at any time and it will start immediately. Charges will also apply immediately. If you downgrade, your new plan starts from the next billing cycle.

<h4 id="auto-renewed">Are all plans auto-renewed?</h4>
Yes, all TestObject plans - monthly and annual - are auto-renewal subscriptions. To cancel your subscription you have to actively downgrade to the "free" plan. This will not delete your TestObject account and you can re-subscribe to a paid plan at any time.

<h4 id="payment-methods">Which payment methods do you accept?</h4>
We accept credit card payments (Visa, MasterCard, Maestro).
When you've subscribed to a monthly plan, your credit card will be charged monthly. When you've subscribed to an annual plan, the full amount for 12 months will be charged once at the beginning of the billing cycle.
For annual plans we also accept PayPal or direct invoicing. Please contact our sales team for further information: <a href="mailto:sales@testobject.com" style="vertical-align: baseline">sales@testobject.com</a>.

<h4 id="invoice">Will I receive an invoice?</h4>
Yes, you will receive an invoice for every payment via email. You also can access your billing history from your account settings.

<h3 id="FAQ-Technical">FAQ-Technical</h3>

<h4 id="export-ipa">What kind of IPA file do I need to export?</h4>
To test your iOS application on our platform you have to export your IPA file as an Ad Hoc Deployment. Check out this <a href="/docs/guides/creating-ipa/">short guide</a> on how to do it!

<h4 id="Whitelisting">My app is only available within our internal network. Can I use TestObject devices for my testing?</h4>
Yes. All TestObject devices access the internet through the following IP ranges:
 
 - **185.94.24.0/22** for _European data center_
 - **162.222.72.0/21** and **66.85.48.0/21** for _US data center_

Sometimes apps are designed to be run on internal networks, or on networks that can be accessed only from specific IP addresses. In this case, you can add an exception for TestObject to your network's whitelist for the IP ranges mentioned above.

<!-- <h4 id="permissions"></h4>
For Android
For iOS -->
