---
title: Jenkins Configuration with Ant
layout: en
permalink: docs/guides/jenkins-ant-task/
---

For a full continuous integration process automate the execution of your tests created with TestObject. This can be easily achieved by running TestObject Ant Tasks inside of a Continuous Integration Server.

What you need:

+ <strong>A Running Jenkins Installation</strong>
+ <strong>A Jenkins Project for your app</strong>
+ <strong>Installed Jenkins Ant Plugin</strong> If not make sure to install Ant, see: ( <a href="http://www.vogella.com/tutorials/Jenkins/article.html#jenkinsconfiguration" target="_blank">http://www.vogella.com/tutorials/Jenkins/article.html#jenkinsconfiguration</a> )


<h3 id="step1">Step 1: Add the Ant Build File and Ant Plugin to your repository</h3>

+ Download TestObject Ant Tasks: <a href="/attachments/guide/ant-task/testobject-ant-3.06.01.jar" target="_blank">testobject-ant-3.06.01.jar</a>
+ Downlaod the TestObject build.xml  <a href="https://raw2.github.com/testobject/calculator/master/testobject/build.xml" target="_blank">build.xml</a>

+ Put the two files into <strong>your app</strong> repository. For example:

<h3 id="step2">Step 2: Include the Ant Tasks Into Your Ant Build Process</h3>

The following Ant tasks are currently available for TestObject:
{% highlight xml %}
/testobject/build.xml
/testobject/ant/testobject-ant-3.06.01.jar
{% endhighlight %}

<h3 id="step3">Step 3: Configure your Jenkins Project</h3>

+ <strong>Jenkins</strong>
Login into your Jenkins server and go to the project configuration. (Configure)
+ <strong>Ant Task</strong>
Add a new “Invoke Ant Task” (Build > Add Build Step >Invoke Ant)
+ <strong>Build File</strong>
Add the file to your TestObject build file to this field.
{% highlight xml %}
testobject/build.xml
{% endhighlight %}
+ <strong>Properties</strong>
Add the file to your TestObject build file to this field 
{% highlight xml %}
testobject.ant.lib.name=ant/testobject-ant-3.06.01.jar
testobject.user=USER_NAME
testobject.pw=TESTOBJECT_PW
testobject.project=PROJECT
testobject.batch.id=1
apk.path=PATH_TO_YOUR_APK_BASED_ON_BUILD_XML_PATH
apk.version.name=demoApp-$BUILD_NUMBER
{% endhighlight %}

<img class="center shadow" src="/img/guides/jenkins-ant-config.png">

<strong>Click Save. Now you are done!</strong>
You can easily make changes to the build.xml if you want to run more batches at a time for example.

