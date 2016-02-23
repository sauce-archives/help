---
title: Appium REST API
layout: en
permalink: docs/api/appium/
---

<ul>
    <li><a href="#read-devices">Read Devices</a></li>
    <li><a href="#start-suite-report">Start Suite Report</a></li>
    <li><a href="#finish-suite-report">Finish Suite Report</a></li>
    <li><a href="#finish-test-report">Finish Test Report</a></li>
    <li><a href="#update-suite">Update Suite</a></li>
</ul>

Base URL:

{% highlight javascript %}
https://app.testobject.com:443/api/rest/appium/v1
{% endhighlight %}

Request headers:

{% highlight javascript %}
Content-Type: application/json
{% endhighlight %}

All requests should be made with basic authentication where the username is your API key and the password is empty:

{% highlight javascript %}
username={:yourApiKey}
password=
{% endhighlight %}

Please note: The requests must be sent while the Appium session is still running, that is, before quitting the Appium driver.


<h4 id="read-devices">Read Devices</h4>

Returns the IDs of the devices which you had selected for the specified suite.

{% highlight javascript %}
GET /suites/{:suiteId}/deviceIds
{% endhighlight %}

Response:

{% highlight javascript %}
[
	"Fairphone_real"
]
{% endhighlight %}


<h4 id="start-suite-report">Start Suite Report</h4>

Create a new suite report including its test reports.

{% highlight javascript %}
POST /suites/{:suiteId}/reports/start
{% endhighlight %}

Request body:

{% highlight javascript %}
[{
	"className": "com.myapp.mytestclass",
	"methodName": "myTestMethod",
	"deviceId": "Fairphone_real"
}]
{% endhighlight %}

Response:

{% highlight javascript %}
[{
	id: 1,
	testReports: {
		id: 1,
		test: {
			"className": "com.myapp.mytestclass",
			"methodName": "myTestMethod",
			"deviceId": "Fairphone_real"
		}
	}
}]
{% endhighlight %}


<h4 id="finish-suite-report">Finish Suite Report</h4>

Marks all test reports contained in the specified suite report as finished.

{% highlight javascript %}
PUT /suites/{:suiteId}/reports/{:suiteReportId}/finish
{% endhighlight %}

Response:

{% highlight javascript %}
[{
	id: 1,
	testReports: {
		id: 1,
		test: {
			"className": "com.myapp.mytestclass",
			"methodName": "myTestMethod",
			"deviceId": "Fairphone_real"
		}
	}
}]
{% endhighlight %}


<h4 id="finish-test-report">Finish Test Report</h4>

Sets the status of the specific test report and marks it as finished.

{% highlight javascript %}
PUT /suites/{:suiteId}/reports/{:suiteReportId}/results/{:testReportId}/finish
{% endhighlight %}

Request body:

{% highlight javascript %}
{
	"passed": true|false
}
{% endhighlight %}

Response:

{% highlight javascript %}
{
	id: 1,
	test: {
		"className": "com.myapp.mytestclass",
		"methodName": "myTestMethod",
		"deviceId": "Fairphone_real"
	}
}
{% endhighlight %}


<h4 id="update-suite">Update Suite</h4>

Update the properties of a suite.

{% highlight javascript %}
PUT /suites/{:suiteId}
{% endhighlight %}

Request body:

{% highlight javascript %}
{
	"id": 1,
	"title": "My new suite title",
	"appVersionId": 1,
	"frameworkVersion": "1.3.7",
	"deviceIds": [
		"Fairphone_real"
	]
}
{% endhighlight %}

Response:

{% highlight javascript %}
{
	"id": 1,
	"title": "My new suite title",
	"appVersionId": 1,
	"frameworkVersion": "1.3.7",
	"deviceIds": [
		"Fairphone_real"
	]
}
{% endhighlight %}
