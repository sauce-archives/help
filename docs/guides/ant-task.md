---
title: Automate your Test Execution using Ant
layout: en
permalink: docs/guides/ant-task/
---


<div class="innerCell">
	<p>
		For a full continuous integration process -&nbsp;<span
			style="line-height: 1.4285715;">automate the execution of your
			tests created with TestObject CONTINUOUS. This could be easily done
			by running TestObject CONTINUOUS Ant Tasks.</span>
	</p>
	<p>WHAT YOU NEED:</p>
	<ul style="list-style: disc;">
		<li><strong>Java 1.6 or newer&nbsp;</strong>(check by calling
			'java -version')</li>
		<li><strong>Ant&nbsp;</strong>(installed into a folder of your
			choice)</li>
	</ul>
	<p>LET’S GET STARTED!</p>
	<h2 id="AutomateyourTestExecutionusingAnt-Step1%3ADownloadandinstallTestObjectCONTINUOUSAntTasks">Step
		1: Download and install TestObject CONTINUOUS Ant Tasks</h2>
	<ul style="list-style: disc;">
		<li>Download TestObject Ant Tasks from here:&nbsp;<a href="/attachments/guide/ant-task/testobject-ant-2.29.7.jar">testobject-ant.jar</a></li>
		<li>Extract the content of the zip file into the
			ant_installation_folder/lib<br>
		<br>
		</li>
	</ul>
	<h2
		id="AutomateyourTestExecutionusingAnt-Step2%3AIncludeTestObjectAntTasksintoyourantbuildprocess">Step
		2: Include TestObject Ant Tasks into your ant build process</h2>
	
	<p>The following ant Tasks are currently available for TestObject
		Continuous:</p>
	<ul style="list-style: disc;">
		<li><strong>Login</strong><br>Authenticate yourself against
			TestObject CONTINUOUS (dependency for all other tasks)</li>
		<li><strong>UploadVersion</strong><br>Upload a new .apk file
			and create a new version for it</li>
		<li><strong>ActivateVersion</strong><br>Set an already
			uploaded version as default version for the given projects</li>
		<li><strong>StartBatch</strong><br>Execute a preconfigured
			batch</li>
		<li><strong>GetBatchReport</strong><br>Download the results
			for a given batch execution<br>
		<br></li>
	</ul>
	<p>To load the TesObject Continuous ant tasks, first include the
		following snippet into your build.xml</p>
	<div class="code panel pdl" style="border-width: 1px;">
		<div class="codeHeader panelHeader pdl"
			style="border-bottom-width: 1px;">
			<b>include TestObject Continuous ant tasks</b>
		</div>

{% highlight xml %}
<?xml version="1.0"?>
<project name="SampleBuild" default="someTask" basedir=".">

...

<taskdef resource="org/testobject/extras/ant/tasks.properties">
   	<classpath>
       	<pathelement location="testobject-ant-2.29.7.jar"/>
   	</classpath>
</taskdef>

...

</project>
{% endhighlight %}

	</div>
	<p>If you have included this snipped call the predefined tasks:</p>
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

<p>A full fledged version of your build.xml may look like the
		following file. It uploads and activates a new apk file and starts a
		batch. When the results are available it distributes them to different
		properties.</p>
	
<strong>Sample Ant Script</strong>		
{% highlight xml %}
<?xml version="1.0"?>
<project name="TestObjectSampleScript" default="getBatchReport" basedir=".">
    <!-- load the testobject ant tasks -->
    <taskdef resource="org/testobject/extras/ant/tasks.properties">
            <classpath>
                <pathelement location="testobject-ant-2.29.7.jar"/>
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
	
</div>