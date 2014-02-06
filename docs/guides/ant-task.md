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

+ Download TestObject Ant Tasks: <a href="/attachments/guide/ant-task/testobject-ant-3.06.01.jar">testobject-ant-3.06.01.jar</a>
+ Extract the content of the zip file into <em>ant_installation_folder/lib</em>


<h3 id="AutomateyourTestExecutionusingAnt-Step2%3AIncludeTestObjectAntTasksintoyourantbuildprocess">Step 2: Include the Ant Tasks Into Your Ant Build Process</h3>

The following Ant tasks are currently available for TestObject:

+ <strong>Login</strong><br>
Authenticate yourself against TestObject (dependency for all other tasks)
+ <strong>UploadVersion</strong><br>
Upload a new .apk file and create a new version for it
+ <strong>ActivateVersion</strong><br>
Set an already uploaded version as default version for the given projects
+ <strong>StartBatch</strong><br>
Execute a preconfigured batch
+ <strong>GetBatchReport</strong><br>
Download the results for a given batch execution


To load the TesObject CONTINUOUS Ant tasks, first include the following snippet into your build.xml:

{% highlight xml %}
<?xml version="1.0"?>
<project name="SampleBuild" default="someTask" basedir=".">

...

<taskdef resource="org/testobject/extras/ant/tasks.properties">
   	<classpath>
       	<pathelement location="testobject-ant-3.06.01.jar"/>
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

A full fledged version of your build.xml may look like the following file. It uploads and activates a new .apk file and starts a batch. When the results are available it distributes them to different properties.

{% highlight xml %}
<?xml version="1.0"?>
<project name="TestObjectSampleScript" default="getBatchReport" basedir=".">
    <!-- load the testobject ant tasks -->
    <taskdef resource="org/testobject/extras/ant/tasks.properties">
            <classpath>
                <pathelement location="testobject-ant-3.06.01.jar"/>
            </classpath> 
    </taskdef> 
 
    <!-- properties used by all tasks to identify the correct project -->
    <property name="testobject.user" value="foobar" />
    <property name="testobject.project" value="komoot" />
 
    <!-- login into testobject, must be always executed before other tasks are called -->
    <target name="login">
        <login username="my_username" password="my_password" />
    </target>
 
    <!-- upload a new apk file, versionId is stored in 'new.version' property -->
    <target name="uploadVersion" depends="login">
        <uploadVersion name="new version" file="my.apk" response="new.version" />
    </target>
     
    <!-- set the new version as default -->
    <target name="activateVersion" depends="uploadVersion">
        <activateVersion versionId="${new.version}" />
    </target>
 
    <!-- start the batch with id 1 and store the batch report id in 'new.batch' -->
    <target name="startBatch" depends="activateVersion">
        <startBatch batchId="1" response="new.batch"/>
        <echo message="http://app.testobject.com/#/${testobject.user}/${testobject.project}/reports/${new.batch}"></echo>
    </target>
     
    <!-- download the report of the created batch and store the result -->
    <target name="downloadBatchReport" depends="startBatch">
        <getBatchReport batchReportId="${new.batch}" status="batch.status" errors="batch.errors" tests="batch.tests"/>
        <condition property="batch.succeeded">
                <equals arg1="${batch.status}" arg2="SUCCESS" />
        </condition>
        <antcall target="fail" />
    </target> 
 
    <target name="fail" unless="batch.succeeded">
        <fail message="Batch Replay failed with ${batch.errors} errors" />
    </target>
</project>
{% endhighlight %}
