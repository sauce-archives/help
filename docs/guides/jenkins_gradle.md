---
title: Jenkins Configuration with Gradle
layout: en
permalink: docs/guides/jenkins-gradle-task/
---

For a full continuous integration process automate the execution of your tests created with TestObject. This can be easily achieved by running TestObject Gradle Tasks within a Continuous Integration Server like Jenkins.

What you need:

+ <strong>A Running Jenkins Installation</strong>
+ <strong>A Jenkins Project for your app</strong>
+ <strong>Installed Jenkins Gradle Plugin</strong> With installed Gradle Version <strong>1.6</strong>


<h3 id="step1">Step 1: Add the Gradle Build File to your repository or extend your existing Gradle Build File</h3>

+ Download the TestObject: <a href="https://github.com/testobject/calculator/blob/master/build.gradle" target="_blank">build.gradle</a>

<h3 id="step2">Step 2: Add the build.gradle files</h3>

+ Add the file into <strong>your app</strong> repository.
{% highlight xml %}
/build.gradle
{% endhighlight %}


<h3 id="step3">Step 3: Install the Environment Injector Plugin in your Jenkins</h3>

+ <strong>Jenkins</strong>
Login into your Jenkins server and go to Manage Jenkins > Manage Plugins > Available > Search for Environment Injector Plugin.
+ <strong>Install</strong>
Click on "Download now and install after restart".
+ <strong>Wait</strong>
Wait for the installation to be finished.

<h3 id="step3">Step 4: Configure your Jenkins Project</h3>

+ <strong>Jenkins</strong>
Go to the project configuration of your app project. (Configure)
+ <strong>Inject environment variables</strong>
Copy the following code to the <strong>Properties Content</strong> field and replace the variables with your username, password, project, batch id and APK path.
{% highlight xml %}
ANDROID_HOME=/var/lib/jenkins/tools/android-sdk/
testobjectusername=USER_NAME
testobjectpassword=TESTOBJECT_PW
testobjectprojectname=PROJECT
testobjectactivateversion=true
testobjectuploadversion=true
testobjectbatches=[1,2]
{% endhighlight %}
<img class="center shadow" src="/img/guides/jenkins-gradle-env-config.png">

+ <strong>Gradle Task</strong>
Add a new “Invoke Gradle Script” (Build > Add Build Step >Invoke Gradle Script)


+ <strong>Gradle Task</strong>
<img class="center shadow" src="/img/guides/jenkins-gradle-config.png">
Configure "testobjectUpload" as Gradle Task in the Tasks field.

<strong>Click Save. Now you are done!</strong></br></br>

You can easily make changes to the build.gradle file if you want to execute other build steps also.

