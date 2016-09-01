---
title: Running Appium tests through Jenkins using Gradle
layout: en
permalink: docs/tools/appium/continuous-integration/jenkins-gradle/
---

To get the most out of your tests, automate their execution within your continuous integration environment. This can be easily achieved by running TestObject Gradle tasks within a Continuous Integration server like Jenkins. This guide will provide a working example that covers a basic scenario: the one in which you need to run an Appium test you are hosting on GitHub against an app you have uploaded on TestObject.

What you will need:

+ <strong>Administrator access to a running Jenkins installation</strong>
+ <strong>A series of plugins:</strong>
    * The Github Jenkins plugin, for accessing the test code directly from GitHub
    * The Environment Injector Plugin to inject environment variables which will provide our test setup with the needed capabilities
    * The JUnit Jenkins plugin, for displaying test results



But before we start, are you looking for a [Basic Setup](#basic) or for a [Suite Setup](#suite) ?

***
***

<h2 id="basic">  Basic setup</h2>
<h3 id="step1">Step 1: adapt your test setup</h3>

First of all, you will need to modify your existing setup so that it retrieves the information needed to initialise the test run on Testobject via environment variables. These can be different depending on the kind of test setup you are using. For example, if you are running a watcher setup, you will need to send over your TestObject API key, an id pointing to the version of your app you want to test and a device id, specifying which device your test should run on. In this case, you would need to modify your test setup slightly, so that you can obtain these values from your runtime environment:

{% highlight java %}
    String apiKey = System.getenv("TESTOBJECT_API_KEY");
    int appId = Integer.parseInt(System.getenv("TESTOBJECT_APP_ID"));
    String deviceId = System.getenv("TESTOBJECT_DEVICE");
{% endhighlight %}

These values would then be sent through the appropriate DesiredCapabilities object:

{% highlight java %}
    DesiredCapabilities capabilities = new DesiredCapabilities();
    capabilities.setCapability(TestObjectCapabilities.TESTOBJECT_API_KEY, apiKey);
    capabilities.setCapability(TestObjectCapabilities.TESTOBJECT_APP_ID, appId);
    capabilities.setCapability(TestObjectCapabilities.TESTOBJECT_DEVICE, deviceId);
{% endhighlight %}

We will be injecting the required values as environment variables using the Jenkins Environment Injector Plugin.

<h3 id="step2">Step 2: set up a Jenkins job</h3>

![Job creation](/img/guides/jenkins_gradle_suite/create_new_item.png)

Select "new item" in your main Jenkins screen (you will only see this option if you have administrator priviledges).
Select new freestyle Jenkins project and insert a title of your choice, then proceed.

![Defining parameters](/img/guides/jenkins_gradle_suite/parameters.png)

The first thing you will have to do is check the box next to the "This build is parameterized" label. A new button, "Add label", will appear. Select it and click on the option that reads "String parameter". This will be the field in which you input the value of your TestObject API key when you launch your test through Jenkins, so you will have to name it "TESTOBJECT_API_KEY" (or whatever other name you have specified in step 1) and give it the API key of the app you want to test as a value.

You will have to repeat this step for the other two capabilities as well. The second one will have "TESTOBJECT_APP_ID" as a name and the ID of the app version you want to test as a value, while the third one will be named "TESTOBJECT_DEVICE" and will have the name of the device(s) you want to test on as a value.

![Defining repository](/img/guides/jenkins_gradle_suite/git_repo.png)

After that is done, scroll down to the "Source code management" section, select "Git" and enter the URL of the repository where your test is being hosted.


![Defining build](/img/guides/jenkins_gradle_suite/build.png)

Next, scroll down to the "Build" section, click "Add build step" and select "Invoke Gradle script". Here are two scinarios, implement the one that works for you:

+ select the "Invoke Gradle" option and make sure you do Not select the "(defaut)" one which has brackets, but you select instead the "default" one without brackets or another version you have.

OR

+ select the "Use Gradle Wrapper" option and make sure the boxes next to "Make gradlew executable" are checked and "From Root Build Script Dir" are checked.

The last step would be to insert the "clean" and "test" tasks into the dedicated field (as a single string, so "clean test"). This way your tests will be executed from a clean start every time. If you need to run only some of the tests in your project, modify your build.gradle file to exclude the excess ones or specify all those that should be included. An example of this would be:

{% highlight java %}
test {
    exclude 'your/package/name/TestToIgnore.class'
}
{% endhighlight %}

You can find more information on how to do this on the official [Gradle documentation](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.testing.Test.html).

Once this is done, scroll down to the "Post-build Actions" section and, from the "Add post-build action" menu, select "Publish JUnit test result report". This way you will have access to the results of your tests not only on TestObject, but also directly from Jenkins.

![Defining post-build](/img/guides/jenkins_gradle/screenshot5.png)

Finally, click on "save" to save the configuration.

<h3 id="step3">Step 3: run your tests!</h3>

Everything is set, now you just need to select "Build with parameters" from the menu on the left and either immediately launch the build or modify the parameters (in case you want to change app, app version or test device) and then launch. Give the test some time to be run. As soon as it is done the build status icon will stop blinking and you will be able to access the "test results" section to see what the outcome of the test you just ran was.


***
***

<h2 id="suite">  Suite setup</h2>
<h3 id="step1">Step 1: adapt your test setup</h3>

First of all, you will need to modify your existing setup so that it retrieves the information needed to initialise the test suite run on Testobject via environment variables.These can be different depending on the kind of test setup you are using. For example, if you are running a watcher setup, you will need to send over your TestObject API key and your suite Id you are using. In this case, you would need to modify your test setup slightly, so that you can obtain these values from your runtime environment:

{% highlight java %}
    String apiKey = System.getenv("TESTOBJECT_API_KEY");
    int suiteId = Integer.parseInt(System.getenv("TESTOBJECT_SUITE_ID"));
{% endhighlight %}

These values would then be sent through the appropriate DesiredCapabilities object in your setUp method:

{% highlight java %}
    DesiredCapabilities capabilities = new DesiredCapabilities();
    capabilities.setCapability("TESTOBJECT_API_KEY", apiKey);
    capabilities.setCapability("TESTOBJECT_SUITE_ID", suiteId);
{% endhighlight %}

Or you can write it in this way:

{% highlight java %}
    DesiredCapabilities capabilities = new DesiredCapabilities();
    capabilities.setCapability("TESTOBJECT_API_KEY", apiKey);
    capabilities.setCapability("TESTOBJECT_SUITE_ID", suiteId);
{% endhighlight %}

We will be injecting the required values as environment variables using the Jenkins Environment Injector Plugin.

<h3 id="step2">Step 2: set up a Jenkins job</h3>

![Job creation](/img/guides/jenkins_gradle_suite/create_new_item.png)

Select "new item" in your main Jenkins screen (you will only see this option if you have administrator priviledges).
Select new freestyle Jenkins project and insert a title of your choice, then proceed.

![Defining parameters](/img/guides/jenkins_gradle_suite/parameters.png)

The first thing you will have to do is check the box next to the "This build is parameterized" label. A new button, "Add label", will appear. Select it and click on the option that reads "String parameter". This will be the field in which you input the value of your TestObject API key when you launch your test through Jenkins, so you will have to name it "TESTOBJECT_API_KEY" (or whatever other name you have specified in step 1) and give it the API key of the app you want to test as a value.

You will have to repeat this step for the other capabilities as well. The second one will have "TESTOBJECT_SUITE_ID" as a name and the ID of the suite you want to test on  as a value.

![Defining repository](/img/guides/jenkins_gradle_suite/git_repo.png)

After that is done, scroll down to the "Source code management" section, select "Git" and enter the URL of the repository where your test is being hosted.

![Defining build](/img/guides/jenkins_gradle_suite/build.png)

Next, scroll down to the "Build" section, click "Add build step" and select "Invoke Gradle script". Here are two scinarios, implement the ONE that works for you:

+ select the "Invoke Gradle" option and make sure you do Not select the "(defaut)" one which has brackets, but you select instead the "default" one without brackets or another version you have.

OR

+ select the "Use Gradle Wrapper" option and make sure the boxes next to "Make gradlew executable" are checked and "From Root Build Script Dir" are checked.

The last step would be to insert the "clean" and "test" tasks into the dedicated field (as a single string, so "clean test"). This way your tests will be executed from a clean start every time. If you need to run only some of the tests in your project, modify your build.gradle file to exclude the excess ones or specify all those that should be included. An example of this would be:

{% highlight java %}
test {
    exclude 'your/package/name/TestToIgnore.class'
}
{% endhighlight %}

You can find more information on how to do this on the official [Gradle documentation](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.testing.Test.html).

Once this is done, scroll down to the "Post-build Actions" section and, from the "Add post-build action" menu, select "Publish JUnit test result report". This way you will have access to the results of your tests not only on TestObject, but also directly from Jenkins.

![Defining post-build](/img/guides/jenkins_gradle/screenshot5.png)


Finally, click on "save" to save the configuration.


<h3 id="step3">Step 3: run your tests!</h3>

Everything is set, now you just need to select "Build with parameters" from the menu on the left and either immediately launch the build or modify the parameters (in case you want to change app, app version or test device) and then launch. Give the test some time to be run. As soon as it is done the build status icon will stop blinking and you will be able to access the "test results" section to see what the outcome of the test you just ran was.
