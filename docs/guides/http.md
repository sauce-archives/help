---
title: HTTP Requests
layout: en
permalink: docs/guides/http/
---

If you want to grab or modify some data from an HTTP server in a test, you can do that with the <a href="../../api/scripting/#http" target="_blank">HTTP</a> function.
Here's how you do it:

#### HTTP GET Method

{% highlight js %}
var response = http().doGet('http://echo.jsontest.com/echo/testobject')
print(response.status)
print(response.json.echo)

{% endhighlight %}


#### HTTP POST Method

{% highlight js %}
var response = http().doPost('http://echo.jsontest.com/echo/testobject', { some: 'data' })
print(response.status)
print(response.json.echo)

{% endhighlight %}

#### Using the Response Data String

If the HTTP request you use returns a format other than JSON, you can use the String **data** property of the response object:

{% highlight js %}
var response = http().doGet('http://www.w3schools.com/xml/note.xml')
print(response.data)

{% endhighlight %}

Check out our <a href="../../api/scripting/#http" target="_blank">API Documentation</a> for more details about the **HttpResponse** object and other HTTP methods we support.