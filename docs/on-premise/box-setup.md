---
title: Setting up your On-Premise Pool
layout: en
permalink: docs/on-premise/
---


<li><a href="#prerequisite">Prerequisite</a></li>
<li><a href="#installation">Installation</a></li>

TestObject On-Premise is the perfect solution, if you don't want to dispense with your own device infrastructure.
With the local distribution of our software, not one bit of you app's data will leave your company, while enjoying the full range of <a href="/docs/testing-tools/manual-testing/">Manual testing</a>, as well as automated testing tools, such as <a href="/docs/tools/appium/introduction/">Appium</a>, <a href="/docs/testing-tools/robotium-espresso/introduction/">Espresso or Robotium</a>.

For further information on your own TestObject On-Premise solution, please contact <a href="mailto:sales@testobject.com">Timo Euteneuer</a>.

If you encounter any problems during the setup process don't hesitate to contact your personal support contact.



<h3 id=prerequisite>Prerequisite</h3>

<li><a href="#credentials">Credentials</a></li>
<li><a href="#architecture">System Architecture</a></li>

<h4 id="credentials">Credentials</h4>

Every TestObject Box has its own set of credentials which will be sent to you individually. As soon as you have received those credentials you will be able to start setting up your own personal on-premise solution.

<h4 id="architecture">System Architecture</h4>

To be able to use TestObject On-Premise you need to install a TestObject App instance, a TestObject Monitoring Instance, and at least one TestObject Device Pool instance. You will also need to install a MongoDB and several dependencies depending on your desired testing setup.

The <strong>App</strong> instance is responsible for hosting the TestObject Web UI. It provides user management, App management and remote controls the TestObject device pool(s).

The <strong>Monitoring</strong> instance tracks device health and works to keep devices ready for testing.

The <strong>Pool</strong> instance is responsible for talking to the different mobile phones. One device pool instance can manage only one type of mobile operating system like either iOS or Android devices. Thus if you want to test on both platforms you need to install two device pool instances.

For this example we use a setup with one host machine for the app, monitoring, and pool instances. Additionally we will need an OS X host to connect to the iOS pool.

<h3 id=installation>Installation</h3>

<li><a href="#docker">Docker Installation</a></li>
<li><a href="#ios-install">IOS Pool Installation</a></li>
<li><a href="#configure">Configure On-Premise</a></li>
<li><a href="#start-testing">Start Testing</a></li>

<h4 id="docker">Docker Installation</h4>

To simplify the installation of TestObject On-Premise, we'll be making use of a tool called Docker, as well as Docker compose. Before continuing with your On-Premise installation, install both <a href="https://docs.docker.com/engine/installation/" target="_blank">Docker</a> and <a href="https://docs.docker.com/compose/install/" target="_blank">Docker Compose</a> on your On-Premise host.

All of the components of your On-Premise setup will run as Docker containers. These containers will be created from Docker images which are hosted on our TestObject registry. The configuration needed to create the containers will be read from a configuration file by Docker Compose.

Use the <a href="#credentials">TestObject credentials</a> you received to <strong>log in to the registry</strong>:


    testobject@testobject-onpremise-pool:~$ docker login quay.io
    Username: testobject+[youruser]
    Password: [your token]
    Email:
    WARNING: login credentials saved in /home/testobject/.docker/config.json
    Login Succeeded


As stated in the log output, the credentials will be stored on the host so that this step is a <strong>one time action per host</strong>.

<h4 id="ios-install">IOS Pool Installation</h4>

If you are setting up your On-Premise solution to include an iOS pool, you will need to first prepare the iOS pool. The iOS pool container will need to connect to an OS X host.

<h5>Configure OS X Host</h5>

On your OS X Host, create a user called iOS. Install the following dependencies:

Install Homebrew:

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Install node:

    brew install node

Install git:

    brew install git

Create a work folder:

    mkdir -p /Users/ios/.testobject_devices/work

Install libvncserver library:

    brew tap false-git/local
    brew install libvncserver

Install ios webkit debug proxy:

    brew install ios-webkit-debug-proxy

Install ideviceinstaller:

    brew install -v --24acd595323ab6c57339a901fcf67735c75becfb --fresh --build-from-source ideviceinstaller

Install Java:

    brew install wget

    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-macosx-x64.dmg

    hdiutil mount jdk-8u45-macosx-x64.dmg

    sudo installer -pkg /Volumes/JDK\ 8\ Update\ 45/JDK\ 8\ Update\ 45.pkg -target /

Install libimobiledevice

    brew install libimobiledevice

Remove apps that hijack usb connection:

    rm -rf /Applications/iTunes.app
    rm -rf /Applications/Photos.app
    rm -rf /Applications/Photo\ Booth.app
    rm -rf /Applications/Image\ Capture.app

Install XCode

Ensure that your /root/ios-config folder contains id_rsa.pub, id_rsa, certificate.p12, and testobject.mobileprovision files. These will be needed to start the iOS pool.

<h5>SSH Connection</h5>
Now that the OS X host is configured, move to your iOS pool host. First we will generate ssh keys on the iOS pool host. When asked where to save the keys, specify /root/ios-config/id_rsa:

    sudo -i
    mkdir /root/ios-config
    ssh-keygen -t rsa -C "[abc]"

You received both a public and a private key. We now copy the public key the OS X Host. While still logged in as the root user, run:

    ssh-copy-id -i /root/ios-config/id_rsa.pub ios@<OS X Host ip address>
    exit

<h5>Apple Certifications</h5>
On the <a href="https://developer.apple.com/" target="_blank">Apple Developer site</a> generate your certificates. For the iOS pool you must save testobject.mobileprovision file and certificate.p12 files in /root/ios-config on the iOS pool host.

<h4 id="configure">Configure On-Premise</h4>

Move the <a href="/attachments/on-premise/on-premise-configuration.zip" target="_blank">on-premise-configuration.zip</a> file from the previous section onto your On-Premise host and expand the file. Your on-premise-configuration folder will contain base.yml, docker-compose.yml, and mongo-settings.yml files.

To install all containers on a single host machine, open docker-compose.yml in your text editor and modify enter information for the following fields:

<ul>
    <li>app<ul>
      <li>env.host.name: Specifies the domain name or ip of the host machine.</li>
      <li>web.baseurl: Specifies the domain name or ip address where your On-Premise installation will be reached.</li>
    </ul></li>
    <li>ios-pool<ul>
      <li>volumes_from: List all of the Appium versions you will install.</li>
      <li>server.id: Specifies the name of the pool.</li>
      <li>env.host.name: Specifies the domain name or ip of the host machine.</li>
      </ul></li>
    <li>android-pool<ul>
      <li>volumes_from: Specifies the Appium versions you will install. Must also list testobject-android-sdk.</li>
      <li>server.id: Specifies the name of the pool.</li>
      <li>env.host.name: Specifies the domain name or ip of the host machine.</li>
      <li>device.pool.vmlite.license: Your vmlite license.</li>
      </ul></li>
 </ul>

For each Appium version you listed, you should also modify docker-compose.yml to create a container for this Appium version. You can do this by adding more entries in docker-compose.yml following the format used for appium-1.4.10:

    appium-1.4.10:
      image: quay.io/testobject/appium:1.4.10
      container_name: "appium-1.4.10"

Now to continue configuring your On-Premise setup, open mongo-settings.yml in your text editor. The field mongo.hostname must be set to the ip address where your MongoDB container will be reached.

To start your On-Premise setup, move into the folder containing docker-compose.yml and run:

    docker-compose up -d

This will read your configuration files and create the specified containers.

<h5>Alternative Architectures</h5>
It is also possible to distribute the On-Premise setup across mutliple hosts. For example, running the iOS and Android pool containers on one host and the app, monitoring, and mongo containers on another host. To do this, split the contents of docker-compose.yml accordingly and on both hosts run:

    docker-compose up -d

Docker Compose will create only the specified containers, and the containers will communicate between the hosts via http.

<h5>Populate database</h5>

Now that the On-Premise containers are created, we can populate the database with some initial information:

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak populateDevicePoolDatabase  
    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak populateAppDatabase

You can also create initial users:

    docker run --rm --link testobject-mongo:mongo --link testobject-app:app quay.io/testobject/sak user -c create -username admin -password [your password] -email [your@email.com] -firstName [John] -lastName [Doe]

<h4 id="start-testing">Start Testing</h4>
<h5>Connect iOS Devices</h5>

We can now add device information into the database using the TestObject SAK tool. If you haven't already done this for the Android pool, run the following command to insert standard device information to the database:

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak populateDeviceDescriptors


Let us add a device to the pool now

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak device -c create -poolId pool-[your pool name] -deviceDescriptorId [your ios device] -phoneId [phone Identifier] -wifiName [your wifi] -wifiPassword [1234qwer] -osxHost [host ip] -osxSSHPort 22 -osxUser ios -osxAppiumPort 14000

The phoneId is the UDID of the iOS device. Also, osxHost is the ip address of your OS X Host.

<h5 id="android-install">Connect Android Devices</h5>

Before you are able to test on an Android Device, you need to configure the device. First connect the device to wifi. Next, modify the following settings:

<ul>
  <li>Enable Developer Options<ul>
    <li>On Android 4.0 and higher: Navigate to Settings > About Device and tap several times on build number.</li>
    <li>On Android version lower than 4.0: Navigate to Settings > Applications > Development</li>
    </ul></li>
  <li>Developer Options<ul>
    <li>Enable usb debugging (adb)</li>
    <li>Allow mock locations</li>
    <li>On Android 5 and higher: disable 'Verify apps over usb'</li>
    </ul></li>
  <li>Security<ul>
    <li>Allow Untrusted sources (On Android version lower than 4.0: Settings > Applications)</li>
    <li>On Android 4: Disable 'Verify adb apps'</li>
    </ul></li>
  <li>Screen<ul>
    <li>Disable screen auto rotation</li>
    <li>On Android 4 and higher: disable Daydream</li>
    </ul></li>
  <li>Set local time zone</li>
  <li>Sound<ul>
    <li>On Android version less than 4: disable all sounds under 'Feedback'</li>
    <li>On Android 4: disable all sounds under 'System'</li>
    <li>On Android 5 and higher: disable all sounds under 'Sound & Notifications > Other Sounds'</li>
    </ul></li>
</ul>

Next, connect to the Play Store.

Install <a href=" http://www.vmlite.com/vncserver/VMLiteVNCServer-license.apk">vmlite</a> via adb. Android 2.2 needs the version from the Play Store.

Now we need to find the device ID using adb. Plug your device into a computer with Android Studio and run:

    adb devices

Save the device ID you receive because you will need it in the following step.

Now with the device properly configured, you can insert device information into the database using the TestObject SAK tool. First we insert standard device information into the database:

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak populateDeviceDescriptors

Now add your device's information into the database:

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak device -c create -poolId pool-[your pool name] -deviceDescriptorId [android_phone] -phoneId [ABC12345] -wifiName [your wifi] -wifiPassword [1234qwer] -playAccount [abc@gmail.com] -playAccountPassword [1234qwer]

The poolId can be found in your docker-compose.yml file. It is under the server.id field of android-pool. The phoneId is the device ID you found earlier using adb.

<h4>Begin Testing</h4>
Your On-Premise setup is now accessible, and you're ready to begin testing! Open your browser and enter the app host's ip address. You should see the TestObject login.
