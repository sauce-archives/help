---
title: Setting up your On-Premise Pool
layout: en
permalink: docs/on-premise/
---


<li><a href="#prerequisite">Prerequisite</a></li>
<li><a href="#installation">Installation</a></li>
<li><a href="#first-test">Get ready for your first test</a>  </li>

The TestObject Box is the perfect solution, if you don't want to dispense with your own device infrastructure.
With the local distribution of our software, not one bit of you app's data will leave your company, while enjoying the full range of <a href="/docs/testing-tools/manual-testing/">Manual testing</a>, as well as automated testing tools, such as <a href="/docs/tools/appium/introduction/">Appium, <a href="/docs/testing-tools/robotium-espresso/introduction/">Espresso or Robotium</a>. 

For further information on your own TestObject Box, please contact <a href="mailto:timo@testobject.eu">Timo Euteneuer</a>.

If you encounter any problems during the setup process don't hesitate to contact your personal support contact.



<h3 id=prerequisite>Prerequisite</h3>

<li><a href="#credentials">Credentials</a></li>
<li><a href="#architecture">System Architecture</a></li>
<li><a href="#depiction">Depiction of the Setup</a></li>
<li><a href="#sak">TestObject SAK</a></li>


<h4 id="credentials">Credentials</h4>

Every TestObject Box has its own set of credentials which will be sent to you individually. As soon as you have received those credentials you will be able to start setting up your individual testing pool. 
 

<h4 id="architecture">System Architecture</h4>

To be able to use TestObject OnPremise you need to install at least one TestObject App instance and one TestObject Device Pool instance. 
Both instances depend on <a href="#mongo">MongoDB</a>. Depending on the setup they can use the same MongoDB instance or two dedicated ones.

The <strong>App</strong> instance is responsible for hosting the TestObject Web UI. It provides user management, App management and remote controls the TestObject device pool(s).

The <strong>Pool</strong> instance is responsible for talking to the different mobile phones. One device pool instance can manage only one type of mobile operating system like either iOS or Android devices. Thus if you want to test on both platforms you need to install two device pool instances with different configurations.

For this example we use a setup with two host machines, one is running the App instance and the second host machine runs the two Pool intances: one for Android and one for iOS.

<h4>Depiction of the Setup</h4>

Here we see how our standard setup looks like 
<--!
add a graphic with the setup
-- more explanantion necessary??
-->

<h4 id="sak">TestObject SAK</h4>

For the configuration of the TestObject app instance, as well as for the TestObject pool instance, we provide a tool called Swiss Army Knife (SAK). The SAK tool is also provided as a docker image. 

This tools facilitates the configuration and allows some customization of the setup and minimizes the overhead. Alternatively, you are able to all default configuration into a docker run command.

<h3 id=installation>Installation</h3>

<li><a href="#docker">Docker Installation</a></li>
<li><a href="#sak">TestObject SAK</a></li>
<li><a href="#mongo">MongoDB Installation</a></li>
<li><a href="#android-install">Android Pool Installation</a></li>
<li><a href="#ios-install">IOS Pool Installation</a></li>


<h4 id="docker">Docker Installation</h4>

For the installation TestObject use a software called <strong>Docker Version 1.8.x or higher</a></strong> <a href="https://www.docker.com" target="_blank">(https://www.docker.com)</a>.
To draw on Docker simplifies the process of downloading new releases and its installation on a host.

<p>To download the docker images access our TestObject docker registry hosted at <a href="https://quay.io/" target="_blank">https://quay.io</a>. <br>
Revert to <a href="#credentials">credentials</a> you received to <strong>log in to the registry</strong>:
</p>

    testobject@testobject-onpremise-pool:~$ sudo docker login quay.io
    Username: testobject+[youruser]
    Password: [your token]
    Email:
    WARNING: login credentials saved in /home/testobject/.docker/config.json
    Login Succeeded


As stated in the log output the credentials will be stored on the host, so that this step is a <strong>one time action per host</strong>.



<h4 id="mongo">MongoDB Installation</h4>


We will install two different MongoDB instances, since we will run our App on one host machine, while the Android and iOS pools share a second machine.

Theoretically the <a href="#architecture">system architecture</a> for every specific setup can look different depending on your individual use case.

Run the <a href="#sak">TestObject SAK</a> to create a MongoDB container with some default configuration. Most importantly the container will store all MongoDB data in the /data/mongo folder of the host system:

    sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/testobject/sak mongo -c create 
    pulling image mongo:3.0.6 
    
After the MongoDB installation is finished, which might take a while, you will see this output:

    created container with name testobjectmongo and id  7b2c11a7545192f09fc671e86f66154d2fe47720d4ca5e0d8e035f91a1637299

This command creates a new docker container which will run the MongoDB. The next step is to start the container:

    sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/testobject/sak mongo -c start

or a bit simpler:

    sudo docker start testobject-mongo
    
To check if the container is really running run:

    sudo docker ps
    
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
    7b2c11a75451        mongo:3.0.6         "/entrypoint.sh mongo"   2 minutes ago       Up 6 seconds        0.0.0.0:27017->27017/tcp   testobject-mongo

Don't forget to repeat the installation for additional host machines.


<h4 id=android-install>Android Pool Installation</h4>

Now we can get started to setup the TestObject instances. Let's start with an Android device pool. 

<h5>Install the Android SDK</h5>

The Android device pool needs an Android SDK to function properly. This gets installed in a separate Docker container which allows it to  be updated independently from the TestObject device pool image.  The SDK gets provided as a so called volume image which needs to be executed only once (and doesn’t need to run permanently).


This command will create the container, download the Android SDK and run it:

    sudo docker run —name=testobject-android-sdk quay.io/testobject/android-sdk-linux
    
<h5 id="appium-install">Install the Desired Appium Version</h5>

The second optional dependency is Appium. To allow you to use the Appium version you need you can download them separately. They are also provided as volume images which need to be executed only once:


Select appium versions to download:

<a href="https://quay.io/repository/testobject/appium?tag=latest&tab=tags">https://quay.io/repository/testobject/appium?tag=latest&tab=tags</a>

<--! credentials or other link: Repository not found! -->

Download the image for the desired appium version and run it once:

    sudo docker run --name=appium-1.4.8 quay.io/testobject/appium:1.4.8

Repeat this step to add additional Appium versions:

    sudo docker run --name=appium-1.3.7 quay.io/testobject/appium:1.3.7

<h5>Create the Android Pool Container</h5>

Now all required and optional dependencies are in place. It is time to create and run the Android Pool Container.

This command needs the following parameters:

<ul>
    <li>poolName —> a unique name for the pool (required)</li>
    <li>poolHostName —> the domain name or ip of the host machine (required) </li>
    <li>vmliteLicense —> license key for vmlite (required)</li>
    <li>appiumVersions —> give a list of <a href="#appium-install">installed appium containers</a> to be mounted by the pool (optional)</li>
 </ul>

    sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/testobject/sak android -c create \
    -poolName pool-android-1 -poolHostname 10.253.0.131 \
    -vmliteLicense K2394E8382N9498L9243E \
    -appiumVersions appium-1.3.7 appium-1.4.8

<h5>Start the Android Pool Container</h5>

    sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/testobject/sak android -c start
    
<h5>Connect Devices</h5>

To connect a device ...
Now its time to setup the devices you would like to connect to the Android Device Pool.

<--! link and make an indenpendent device setup description -->


Sync Device Descriptors from Production:
<--! our production? --> they don't have their "own descriptors?" -->

    sudo docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak \ populateDeviceDescriptors

Add a Device to the Pool:

    sudo docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak device -c create -poolId pool-android-1 -deviceDescriptorId HTC_One_M8_real -phoneId FA43MWM01768 -wifiName TestObject -wifiPassword 1234qwer -playAccount abc@gmail.com -playAccountPassword 1234qwer

Sync udev rules:
<--! what is this and why? -->
    
    sudo docker run --rm --link testobject-pool-android -v /var/run/docker.sock:/var/run/docker.sock quay.io/testobject/sak prepareUdevRules | sudo bash -s

Before you continue with the next steps, please restart the host.


<h5>Populate Pool Database</h5>

<--! with what? --> <--! other position??? -->

    sudo docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak populateDevicePoolDatabase  
    
<h4><a id="ios-install">IOS Pool Installation</a></h4>

The workflow to setup an iOS pool is a bit different. The first step here is to generate ssh keys

<h5>SSH Connection</h5>

    ssh-keygen -t rsa -C "abc" 
<--! abc is form credentials, user can chosse freely, username..? -->

You receive both a public and a private key, which need to be saved in a folder on the host e.g. /home/testobject/ios-config

Copy the ssh public key to your OS X host:

    ssh-copy-id -i ios-config/id_rsa.pub ios@192.168.1.182

<h5>Create and Start the iOS Pool Container</h5>

we need to specify some parameters while doing this:
<p>
<ul>
    <li>poolName —> a unique name for the pool (required)</li>
    <li>poolHostName —> the domain name or ip of the host machine (required) </li>
    <li>provisioningProfile —>  (required)</li>
    <li>signingCertificate -> (required)</li> <--! p12 Dateiendung?-->
    <li>sshKeyPrivate -> path to your private ssh key (required)</li>
    <li>sshKeyPublic -> path to your public ssh key (required)</li>
    <li>appiumVersions —> give a list of <a href="#appium-install">installed appium containers</a> to be mounted by the pool (optional)</li>
 </ul>
</p> 
    sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/testobject/sak ios -c create 
    -poolName pool-ios-1 
    -poolHostname 10.253.0.131 
    -provisioningProfile /home/testobject/ios-config/abc.mobileprovision 
    -signingCertificate /home/testobject/ios-config/abc.p12 
    -sshKeyPrivate /home/testobject/ios-config/id_rsa 
    -sshKeyPublic /home/testobject/ios-config/id_rsa.pub 
    -appiumVersions appium-1.3.7 appium-1.4.8



<h5>Create the App Container</h5>

    sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/testobject/sak app -c create -hostName 172.18.4.10 -port 38080

<h5>Populate App database</h5>

    sudo docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak populateAppDatabase

<h5>Connect Devices</h5>

To connect a device ...
Your iOS devices ... -->setup

<--! link and make an indenpendent device setup description -->


Sync Device Descriptors from Production:
<--! our production? --> they don't have their "own descriptors?" -->

    sudo docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak \ populateDeviceDescriptors
-->

Let us add a device to the pool now 
    
    sudo docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak device -c create -poolId pool-ios-1 -deviceDescriptorId iPad_Air_2_16GB_real -phoneId 4318933069f2b028a3a6c5b4766eb515a1a0f6f8 -wifiName TestObject -wifiPassword 1234qwer -osxHost 10.253.0.132 -osxSSHPort 22 -osxUser ios -osxAppiumPort 14000



<h5>Create your first user</h5>

sudo docker run --rm --link testobject-mongo:mongo --link testobject-app:app quay.io/testobject/sak user -c create -username admin -password abcd1234 -email john.doe@gmail.com -firstName John -lastName Doe


<h5></h5>

<h3 id="first-test">Get ready for your first test</h3>

<li><a href=""></a></li>

To operate your new testing pool ...

Integrations --> links to other tutorials

