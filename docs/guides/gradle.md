---
title: Upload an APK with Gradle
layout: en
permalink: docs/guides/gradle/
---

If you're using the [Android Gradle Plugin](http://tools.android.com/tech-docs/new-build-system/user-guide) to build your Android application, you can use our Gradle plugin to automatically upload your latest version to your project on TestObject.
### Step 1: Modify your gradle.build file


All you need to do is to add the following to your existing **gradle.build** file:

{% highlight groovy %}
buildscript {
    repositories {
        // ... your existing repositories
        maven {
            url 'http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo'
        }
    }

    dependencies {
        // ... your existing dependencies
        classpath group: 'org.testobject.extras', name: 'gradle', version: '1.0'
    }
}

// your existing plugins, configurations etc...
apply plugin: 'testobject'

testobject {
    username 'myUser'
    password 'myPassword'
    projectName 'myProject'
    activateVersion true // optional
}

{% endhighlight %}

**Make sure** to replace the placeholders above with your TestObject username and password, as well as the name of the project into which you want to upload the new Version.
If you wish that the uploaded version will be set as the active version of this project add the line ```activateVersion true```.

### Step 2: Run the TestObject Upload Task

Now all that's left to do is to trigger the upload by executing the following gradle task:

```
gradle testobjectUpload
```

### That's It!

You can see the freshly uploaded version on your project's App page:

<img class="center shadow" src="/img/guides/gradle/gradle-01.png">

