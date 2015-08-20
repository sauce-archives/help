---
title: Jenkins Configuration with Gradle
layout: en
permalink: docs/guides/jenkins-gradle-task/
---

To get the most out of your tests, automate their execution within your continuous integration environment. This can be easily achieved by running TestObject Gradle tasks within a Continuous Integration server like Jenkins. This guide will provide a working example that covers a basic scenario: the one in which you need to run an Appium test you are hosting on GitHub against an app you have uploaded on TestObject.

What you will need:

+ <strong>Administrator access to a running Jenkins installation</strong>
+ <strong>A series of plugins:</strong>
    * The Github Jenkins plugin, for accessing the test code directly from GitHub
    * The Environment Injector Plugin to inject environment variables which will provide our test setup with the needed capabilities
    * The JUnit Jenkins plugin, for displaying test results

<h3 id="step1">Step 1: adapt your test setup</h3>

First of all, you will need to modify your existing setup so that it retrieves the TESTOBJECT_API_KEY, TESTOBJECT_APP_ID and TESTOBJECT_DEVICE capabilities from its runtime environment. This will allow you to easily change their values from Jenkins at every execution, instead of being forced to modify the actual code. For example, in a Java setup you would have something that looks like this:

{% highlight java %}
    String apiKey = System.getenv("TESTOBJECT_API_KEY");
    int appId = Integer.parseInt(System.getenv("TESTOBJECT_APP_ID"));
    String deviceId = System.getenv("TESTOBJECT_DEVICE");
{% endhighlight %}

These values would the be sent through the appropriate DesiredCapabilities object:

{% highlight java %}
    DesiredCapabilities capabilities = new DesiredCapabilities();
    capabilities.setCapability(TestObjectCapabilities.TESTOBJECT_API_KEY, apiKey);                                             
    capabilities.setCapability(TestObjectCapabilities.TESTOBJECT_TEST_REPORT_ID, testReportId); 
{% endhighlight %}

<h3 id="step2">Step 2: create a Jenkins job</h3>

Select "new item" in your main Jenkins screen (you will only see this option if you have administrator priviledges).
Select new freestyle Jenkins project and insert a title of your choice, then proceed. Scroll down to the "Source code management" section, select "Git" and enter the URL of the repository where your test is being hosted.

Next, scroll down to the "Build" section, click "Add build step" and select "Invoke Gradle script". Here select the "Use Gradle Wrapper" option and make sure the boxes next to "Make gradlew executable" are checked and "From Root Build Script Dir" are checked. The last step would be to insert the "clean" and "test" tasks into the dedicated field (as a single string, so "clean test"). This way your tests will be executed from a clean start every time. If you need to run only some of the tests in your project, modify your build.gradle file to exclude the excess ones or specify all those that should be included.
An example of this would be:

{% highlight java %}
test {
    exclude 'your/package/name/TestToIgnore.class'
}
{% endhighlight %}

You can find more information on how to do this on the official [Gradle documentation](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.testing.Test.html).

Once this is done, scroll down to the "Post-build Actions" section and, from the "Add post-build action" menu, select "Publish JUnit test result report". This way you will have access to the results of your tests not only on TestObject, but also directly from Jenkins.

<h3 id="step3">Step 3: run your tests!</h3>