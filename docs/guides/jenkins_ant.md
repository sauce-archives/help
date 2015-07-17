---
title: Jenkins Configuration with Ant
layout: en
permalink: docs/guides/jenkins-ant-task/
---

For a full continuous integration process automate the execution of your tests created with TestObject. This can be easily achieved by running TestObject Ant Tasks within a Continuous Integration Server.

What you need:

+ <strong>A Running Jenkins Installation</strong>
+ <strong>A Jenkins Project for your app</strong>
+ <strong>Installed Jenkins Ant Plugin</strong> If not make sure to install Ant, see: ( <a href="http://www.vogella.com/tutorials/Jenkins/article.html#jenkinsconfiguration" target="_blank">http://www.vogella.com/tutorials/Jenkins/article.html#jenkinsconfiguration</a> )


<h3 id="step1">Step 1: Add the Ant Build File and Ant Plugin to your repository</h3>

+ Download TestObject Ant Tasks: <a href="/attachments/guide/ant-task/testobject-ant-4.0.0.jar" target="_blank">testobject-ant-4.0.0.jar</a>
+ Download the TestObject: <a href="https://raw2.github.com/testobject/calculator/master/testobject/build.xml" target="_blank">build.xml</a>

<h3 id="step2">Step 2: Add the files to your app repository</h3>

+ Add the two files into <strong>your app</strong> repository. For example:
{% highlight xml %}
/testobject/build.xml
/testobject/ant/testobject-ant-4.0.0.jar
{% endhighlight %}

<h3 id="step3">Step 3: Configure your Jenkins Project</h3>

+ <strong>Jenkins</strong>
Login into your Jenkins server and go to the project configuration. (Configure)
+ <strong>Ant Task</strong>
Add a new “Invoke Ant Task” (Build > Add Build Step >Invoke Ant)
+ <strong>Build File</strong>
Add the TestObject build file path to the Build File field.
{% highlight xml %}
testobject/build.xml
{% endhighlight %}

<img class="center shadow" src="/img/guides/jenkins-ant-config.png">
+ <strong>Properties</strong>
Copy the following code to the Properties field and replace the variables with your username, password, project, batch id and APK path.
{% highlight xml %}
testobject.ant.lib.name=ant/testobject-ant-4.0.0.jar
testobject.user=USER_NAME
testobject.pw=TESTOBJECT_PW
testobject.app=APP
testobject.testSuite.id=1
testobject.robotiumSuite.id=1
apk.path=PATH_TO_YOUR_APK_BASED_ON_BUILD_XML_PATH
apk.version.name=demoApp-$BUILD_NUMBER
robotiumApk.path=PATH_TO_YOUR_ROBOTIUM_APK_BASED_ON_BUILD_XML_PATH
{% endhighlight %}



<strong>Click Save. Now you are done!</strong></br></br>
You can easily make changes to the build.xml if you want to run more batches at a time for example.

