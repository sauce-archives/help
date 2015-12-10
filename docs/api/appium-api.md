---
title: Appium REST API
layout: en
permalink: docs/api/appium
---


All requests should be made with basic authentication where the username is your TestObject API key and the password is empty:

{% highlight javascript %}
username=your_api_key
password=
{% endhighlight %}

Please note: The requests must be sent while the Appium session is still running, that is, before quitting the Appium driver.


<h4 id="read-devices">Read Devices</h4>

Use this method to read the IDs of the devices which you had selected for the specified suite.

{% highlight javascript %}
GET https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}/deviceIds
{% endhighlight %}

Response:

{% highlight javascript %}
[
	"Fairphone_real"
]
{% endhighlight %}


<h4 id="start-suite-report">Start Suite Report</h4>

Use this method to create a new suite report including its test reports.

{% highlight javascript %}
POST https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}/reports/start
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

Use this method to mark all test reports contained in this suite report as finished.

{% highlight javascript %}
PUT https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}/reports/{suite_report_id}/finish
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

Use this method to set the status of a specific test report and mark it as finished.

{% highlight javascript %}
PUT https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}/reports/{suite_report_id}/results/{test_report_id}/finish
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

Use this method to update the properties of a suite.

{% highlight javascript %}
PUT https://app.testobject.com:443/api/rest/appium/v1/suites/{suite_id}
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
