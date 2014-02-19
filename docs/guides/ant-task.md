---
title: Automated Test Execution with Ant
layout: en
permalink: docs/guides/ant-task/
---

For a full continuous integration process automate the execution of your tests created with TestObject. This can be easily achieved by running TestObject Ant Tasks.

What you need:

+ <strong>Java 1.6 or newer</strong> (check by calling 'java -version')
+ <strong>Ant</strong> (installed into a folder of your choice)


<h3 id="AutomateyourTestExecutionusingAnt-Step1%3ADownloadandinstallTestObjectCONTINUOUSAntTasks">Step 1: Download and Install TestObject Ant Tasks</h3>

+ Download TestObject Ant Tasks: <a href="/attachments/guide/ant-task/testobject-ant-3.08.06.jar">testobject-ant-3.08.06.jar</a>
+ Copy the jar file into <em>ant_installation_folder/lib</em>


<h3 id="AutomateyourTestExecutionusingAnt-Step2%3AIncludeTestObjectAntTasksintoyourantbuildprocess">Step 2: Include the Ant Tasks Into Your Ant Build Process</h3>

The following Ant tasks are currently available for TestObject:

+ <strong>Login</strong><br>
Authenticate yourself against TestObject (dependency for all other tasks)
+ <strong>UploadVersion</strong><br>
Upload a new .apk file and create a new version for it
+ <strong>ActivateVersion</strong><br>
Set an already uploaded version as default version for the given app
+ <strong>StartSuite</strong><br>
Execute a preconfigured suite
+ <strong>GetSuiteReport</strong><br>
Download the results for a given suite execution


To load the TesObject CONTINUOUS Ant tasks, first include the following snippet into your build.xml:

{% highlight xml %}
<?xml version="1.0"?>
<project name="SampleBuild" default="someTask" basedir=".">

...

<taskdef resource="org/testobject/extras/ant/tasks.properties">
   	<classpath>
       	<pathelement location="testobject-ant-3.08.06.jar"/>
   	</classpath>
</taskdef>

...

</project>
{% endhighlight %}


After including the snippet call the predefined tasks:

{% highlight xml %}
<?xml version="1.0"?>
<project name="SampleBuild" default="someTask" basedir=".">

    ...
 
    <target name="login">
        <login username="my_username" password="my_password" />
    </target>
     
    ...
 
</project>
{% endhighlight %}



<h4>Sample Ant Script</h4>

A full fledged version of your build.xml may look like the following file. It uploads and activates a new .apk file and starts a suite. When the results are available it distributes them to different properties.

{% highlight xml %}
<?xml version="1.0"?>
<project name="TestObjectSampleScript" default="downloadSuiteReport" basedir=".">
 
    <!-- properties used by all tasks to identify the correct app -->
	<property name="testobject.ant.lib.name" value="testobject-ant-3.06.01.jar" />
    <property name="testobject.user" value="USERNAME" />
    <property name="testobject.pw" value="PASSWORD" />
    <property name="testobject.app" value="APPNAME" />
	<property name="testobject.testSuite.id" value="1" /> 
	<property name="apk.path" value="PATH_TO_YOUR_APK" />
	
 
    <!-- load the testobject ant tasks -->
    <taskdef resource="org/testobject/extras/ant/tasks.properties">
            <classpath>
                <pathelement location="${testobject.ant.lib.name}"/>
            </classpath> 
    </taskdef> 
 
    <!-- login into testobject, must be always executed before other tasks are called -->
    <target name="login">
        <login username="${testobject.user}" password="${testobject.pw}" />
    </target>
 
    <!-- upload a new apk file, versionId is stored in 'new.version' property -->
    <target name="uploadVersion" depends="login">
        <uploadVersion name="${apk.version.name}" file="${apk.path}" response="new.version" />
    </target>
	
    <!-- set the new version as default -->
    <target name="activateVersion" depends="uploadVersion">
        <activateVersion versionId="${new.version}" />
    </target>

        <!-- set the new version as default -->
    <target name="runCheckup" depends="activateVersion">
        <runCheckup />
    </target>
 
    <!-- start the test suite with id 1 and store the suite report id in 'new.testSuite' -->
    <target name="startTestSuite" depends="activateVersion">
        <startTestSuite testSuiteId="${testobject.testSuite.id}" response="new.testSuite"/>
        <echo message="https://app.testobject.com/#/${testobject.user}/${testobject.app}/reports/${new.testSuite}"></echo>
    </target>
     
    <!-- download the report of the created test suite and store the result -->
    <target name="downloadSuiteReport" depends="startTestSuite">
        <getSuiteReport suiteReportId="${new.testSuite}" status="testSuite.status" errors="testSuite.errors" tests="testSuite.tests"/>
        <condition property="testSuite.succeeded">
                <equals arg1="${testSuite.status}" arg2="SUCCESS" />
        </condition>
        <antcall target="fail" />
    </target> 
 
    <target name="fail" unless="testSuite.succeeded">
        <fail message="Test Suite Replay failed with ${testSuite.errors} errors" />
		<echo message="https://app.testobject.com/#/${testobject.user}/${testobject.app}/reports/${new.testSuite}"></echo>
    </target>
</project>
{% endhighlight %}
