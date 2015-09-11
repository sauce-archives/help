---
title: Integrate Robotium/Espresso into your CI Process
layout: en
permalink: docs/guides/robotium-espresso-jenkins-ant/
---
<ul>
<li><a href="#jenkins-ant">Running Robotium and Espresso through Jenkins with Ant</a> </li>
</ul>

<h3 id="jenkins-ant">Running Robotium and Espresso through Jenkins with Ant</h3>

To get the most out of your tests, automate their execution within your continuous integration environment. This can be easily achieved by running TestObject ANT tasks within a Continuous Integration server like Jenkins.

What you need:

+ <strong>A Running Jenkins Installation</strong>
+ <strong>A Jenkins Project for your app</strong>
+ <strong>Installed Jenkins Ant Plugin</strong> If not make sure to install Ant, see: ( <a href="http://www.vogella.com/tutorials/Jenkins/article.html#jenkinsconfiguration" target="_blank">http://www.vogella.com/tutorials/Jenkins/article.html#jenkinsconfiguration</a> )


<h4 id="step1">Step 1: Add the Ant Build File and Ant Plugin to your repository</h4>

+ Download TestObject Ant Tasks: <a href="/attachments/guide/ant-task/testobject-ant-3.08.06.jar" target="_blank">testobject-ant-3.08.06.jar</a>
+ Download the TestObject: <a href="https://github.com/testobject/calculator/build.xml" target="_blank">build.xml</a>

<h4 id="step2">Step 2: Add the files to your app repository</h4>

+ Add the two files into <strong>your app</strong> repository. For example:
{% highlight xml %}
/testobject/build.xml
/testobject/ant/testobject-ant-3.08.06.jar
{% endhighlight %}

<h4 id="step3">Step 3: Configure your Jenkins Project</h4>

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
testobject.ant.lib.name=ant/testobject-ant-3.08.06.jar
testobject.user=USER_NAME
testobject.pw=TESTOBJECT_PW
testobject.app=APP
testobject.testSuite.id=1
apk.path=PATH_TO_YOUR_APK_BASED_ON_BUILD_XML_PATH
apk.version.name=demoApp-$BUILD_NUMBER
{% endhighlight %}

<strong>Click Save. Now you are done!</strong></br></br>
You can easily make changes to the build.xml if you want to run more batches at a time for example.
