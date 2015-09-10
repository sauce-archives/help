---
title: Running Appium tests with Maven
layout: en
permalink: docs/guides/appium-maven/
---  

    mvn archetype:generate -DgroupId=org.testobject.example -DartifactId=appiumTest -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

Add this as a dependency to pom.xml

    <dependency>
	    <groupId>org.seleniumhq.selenium</groupId>
	    <artifactId>selenium-java</artifactId>
	    <version>2.42.2</version>
    </dependency>
    <dependency>
            <groupId>io.appium</groupId>
            <artifactId>java-client</artifactId>
            <version>1.6.2</version>
    </dependency>

Also replace jUnit version with the '4.11'.  

Create AppiumTest file in `test` folder:  

{% highlight java %}
package org.testobject.example;

import io.appium.java_client.AppiumDriver;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;

public class AppiumTest {

	private static AppiumDriver driver;
	
	@BeforeClass
	public static void setUpClass() throws MalformedURLException {
		DesiredCapabilities desiredCapabilities = new DesiredCapabilities();
		
		desiredCapabilities.setCapability("testobject_api_key", System.getenv("TESTOBJECT_API_KEY"));
		desiredCapabilities.setCapability("testobject_project", System.getenv("TESTOBJECT_PROJECT"));
		desiredCapabilities.setCapability("testobject_app_id", System.getenv("TESTOBJECT_APP_ID"));
		desiredCapabilities.setCapability("testobject_device", System.getenv("TESTOBJECT_DEVICE"));		

		URL url = new URL("https://app.testobject.com:443/api/appium/wd/hub");
		driver = new AppiumDriver(url, desiredCapabilities);		
	}
	
	@AfterClass
	public static void tearDownClass() {
		if (driver != null) {				
			driver.quit();
		}			
	}
	
	@Test
	public void test() throws IOException {
		WebElement button = driver.findElement(By.name("Accessibility"));
		button.click();
	}

}
{% endhighlight %}

Now you can run your test from command line with:  
  
    TESTOBJECT_API_KEY='7034712A82314092B5AAB2F0C18C93E2' TESTOBJECT_PROJECT='api-demos' TESTOBJECT_APP_ID=1 TESTOBJECT_DEVICE=LG_Nexus_4_E960_real mvn test  


Example script with uploading an apk first:  

{% highlight bash %}
#!/bin/bash

APP_ID=$(curl -u "testobject:7034712A82314092B5AAB2F0C18C93E2" -X POST https://app.testobject.com:443/api/storage/upload -H "Content-Type: application/octet-stream" --data-binary @your_app.apk)
TESTOBJECT_API_KEY='7034712A82314092B5AAB2F0C18C93E2' TESTOBJECT_PROJECT='api-demos' TESTOBJECT_APP_ID=$APP_ID TESTOBJECT_DEVICE=LG_Nexus_4_E960_real mvn test
{% endhighlight %}



