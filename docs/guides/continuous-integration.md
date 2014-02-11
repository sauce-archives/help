---
title: Continuous Integration with TestObject
layout: en
permalink: /docs/guides/continuous-integration
---

Figure out how to automate your testing by reading the following How-To guides.

+ <a href="/docs/guides/jenkins-ant-task/">Jenkins Integration with Ant</a>
+ <a href="/docs/guides/ant-task">Automated Test Execution with Ant</a>
+ <a href="/docs/guides/gradle">Upload an APK with Gradle</a>
buildscript {
	repositories {
		mavenCentral()
		maven { url 'http://nexus.testobject.org/nexus/content/repositories/testobject-public-repo' }
	}

	dependencies {
		classpath 'com.android.tools.build:gradle:0.4+'
		classpath group: 'org.testobject.extras', name: 'gradle', version: '2+'
	}
}

apply plugin: 'android'
apply plugin: 'testobject'

dependencies { compile files('libs/android-support-v4.jar') }

android {
	compileSdkVersion 8
	buildToolsVersion '17.0'

	sourceSets {
		main {
			manifest.srcFile 'AndroidManifest.xml'
			java.srcDirs = ['src']
			resources.srcDirs = ['src']
			aild.srcDirs = ['src']
			renderscript.srcDirs = ['src']
			res.srcDirs = ['res']
			assets.srcDirs = ['assets']
		}
	}
}

testobject {
	username $System.env.testobject.username
	password $System.env.testobject.password
	projectName $System.env.testobject.projectname
	activateVersion $System.env.testobject.activateVersion
}
