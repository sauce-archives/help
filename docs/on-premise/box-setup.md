---
title: Setting up your On-Premise Pool
layout: en
permalink: docs/on-premise
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

For this example we use a setup with two host machines, one is running the App instance and the second host machine runs the two Pool instances: one for Android and one for iOS. Additionally, the iOS pool will need to communicate with an OS X Host.

<h3 id=installation>Installation</h3>

<li><a href="#docker">Docker Installation</a></li>
<li><a href="#sak">TestObject SAK</a></li>
<li><a href="#mongo">MongoDB Installation</a></li>
<li><a href="#android-install">Android Pool Installation</a></li>
<li><a href="#ios-install">IOS Pool Installation</a></li>
<li><a href="#app-install">App Installation</a></li>

<h4 id="docker">Docker Installation</h4>

For the installation TestObject uses a software called <a href="https://www.docker.com" target="_blank">Docker (Version 1.8.x or higher)</a>.
Docker simplifies installation and downloading new releases.

<p>To download the docker images access our TestObject docker registry hosted at <a href="https://quay.io/" target="_blank">quay.io</a>.</br></br>
Use the <a href="#credentials">TestObject credentials</a> you received to <strong>log in to the registry</strong>:
</p>

    testobject@testobject-onpremise-pool:~$ docker login quay.io
    Username: testobject+[youruser]
    Password: [your token]
    Email:
    WARNING: login credentials saved in /home/testobject/.docker/config.json
    Login Succeeded


As stated in the log output the credentials will be stored on the host, so that this step is a <strong>one time action per host</strong>.

To simplify the installation process, we will provide you with configuration files for creating docker containers. These configuration files will be read by a tool called Docker Compose.

<h4 id="sak">TestObject SAK</h4>

For the configuration of the TestObject app instance, as well as for the TestObject pool instance, we provide a tool called Swiss Army Knife (SAK). The SAK tool is provided as a docker image.

This tool facilitates the configuration, allows some customization of the setup, and minimizes the overhead.

<h4 id="mongo">MongoDB Installation</h4>

Firstly, we create a MongoDB container with some default configuration. Most importantly the container will store all MongoDB data in the /data/mongo folder of the host system. Move into your Mongo configuration folder and execute:

    docker-compose up -d

This will pull the docker image from a remote repository and start a docker container called testobject-mongo.

To check if the container is really running:

    docker ps

    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
    7b2c11a75451        mongo:3.0.6         "/entrypoint.sh mongo"   2 minutes ago       Up 6 seconds        0.0.0.0:27017->27017/tcp   testobject-mongo


<h4 id=android-install>Android Pool Installation</h4>

Now we can get started to set up the TestObject instances. Let's start with an Android device pool.

<h5>Install the Android SDK</h5>

The Android device pool needs an Android SDK to function properly. This gets installed in a separate Docker container which allows it to be updated independently from the TestObject device pool image.  The SDK gets provided as a so called volume image which needs to be executed only once (and doesn’t need to run permanently).


This command will create the container, download the Android SDK and run it:

    docker run —name=testobject-android-sdk -d quay.io/testobject/android-sdk-linux

<h5 id="appium-install">Install the Desired Appium Version</h5>

The second optional dependency is Appium. Each Appium version you wish to use can be run as a separate Docker container. They are also provided as volume images which need to be executed only once:


Select appium versions to download:

First select the Appium versions to download from our <a href="https://quay.io/repository/testobject/appium?tag=latest&tab=tags">quay.io repository</a>.

Download the image for the desired appium version and run it once:

    docker run --name=appium-1.4.8 quay.io/testobject/appium:1.4.8

Repeat this step to add additional Appium versions:

    docker run --name=appium-1.3.7 quay.io/testobject/appium:1.3.7

<h5>Create the Android Pool Container</h5>

Now all required and optional dependencies are in place. It is time to create and run the Android pool container.

Move into your Android pool configuration folder and open docker-compose.yml in your text editor. You will need to modify the following fields:

<ul>
    <li>server.id<ul>
      <li>This is a unique name for your pool. If this is the first android pool you are installing, you can leave this field as it is.</li>
    </ul></li>
    <li>env.host.name<ul>
      <li>This is the domain name or ip of the host machine. <!-- give discussion on finding correct ip? --></li>
      </ul></li>
    <li>device.pool.vmlite.license<ul>
      <li>This is the license key for vmlite.<!-- Do we need to say where to get this--></li>
      </ul></li>
    <li>volumes_from<ul>
      <li>Specifies the dependencies we installed in the previous steps.</li>
      <li>Add all of the <a href="#appium-install">Appium versions</a> you installed in the previous step. Note that this is an optional dependency.</li>
      </ul></li>
    <li>mongo.hostname<ul>
      <li>This is the domain name or ip of the mongo host.</li>
      </ul></li>
 </ul>

Now with docker-compose.yml properly configured, you can start the Android pool container. Make sure you are in your Android pool configuration folder and run:

    docker-compose up -d

<h5>Connect Android Devices</h5>

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

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak \ populateDeviceDescriptors

Now add your device's information into the database:

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak device -c create -poolId pool-[your pool name] -deviceDescriptorId [android_phone] -phoneId [ABC12345] -wifiName [your wifi] -wifiPassword [1234qwer] -playAccount [abc@gmail.com] -playAccountPassword [1234qwer]

The poolId can be found in your Android pool's docker-compose.yml file. It is under the server.id field. The phoneId is the device ID you found earlier using adb.

Before you continue with the next steps, please restart the host!


Populate Pool Database

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak populateDevicePoolDatabase  


<h4><a id="ios-install">IOS Pool Installation</a></h4>

Now we will set up the iOS pool, as well. The iOS pool will need to communicate with a properly configured OS X host.

<h5>Configure OS X Host</h5>

On your OS X Host, create a user called iOS. Install the following dependencies:

Install Homebrew:

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Install node:

    brew install node

Install git:

    brew install git

Create a work folder:

    mkdir -p /Users/ios/.testobject_devices/work (Is this step needed?)

Install libvncserver library:

    brew tap false-git/local
    brew install libvncserver

Install ios debug proxy:

    brew install ios-debug-proxy

Install ideviceinstaller:

    brew install -v --24acd595323ab6c57339a901fcf67735c75becfb --fresh --build-from-source ideviceinstaller

Install Java:

    brew install wget

    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-macosx-x64.dmg

    hdiutil mount jdk-8u45-macosx-x64.dmg

    sudo installer -pkg /Volumes/JDK\ 8\ Update\ 45/JDK\ 8\ Update\ 45.pkg -target /

Remove apps that hijack usb connection:

    rm -rf /Applications/iTunes.app
    rm -rf /Applications/Photos.app
    rm -rf /Applications/Photo\ Booth.app
    rm -rf /Applications/Image\ Capture.app

Install XCode

<h5>SSH Connection</h5>
Now that the OS X host is configured, move to your iOS pool host. First we will generate ssh keys on the iOS pool host:

    ssh-keygen -t rsa -C "[abc]"

You receive both a public and a private key, which need to be saved in /root/ios-config.

Copy the ssh public key to your OS X Host:

    ssh-copy-id -i /root/ios-config/id_rsa.pub ios@<OS X Host ip address>



<h5>Apple Certifications</h5>
On the <a href="https://developer.apple.com/" target="_blank">Apple Developer site</a> generate your certificates. For the iOS pool you must save testobject.mobileprovision file and certificate.p12 files in /root/ios-config on the iOS pool host.

<h5>Create and Start the iOS Pool Container</h5>

Now that the iOS pool host and the OS X host are properly configured, you can start the iOS pool container.

Move into your iOS pool configuration folder and open the docker-compose.yml in your text editor. You will need to modify the following fields:

<ul>
  <li>server.id<ul>
    <li>This is a unique name for your pool. If this is the first iOS pool you are installing, you can leave this field as it is.</li>
    </ul></li>
  <li>env.host.name<ul>
    <li>This is the domain name or ip of the iOS pool host.</li>
    </ul></li>
  <li>mongo.hostname<ul>
    <li>This is the domain name or ip of the mongo host.</li>
    </ul></li>
  <li>volumes_from<ul>
    <li>Specifies all of the <a href="#appium-install">Appium versions</a> that you have installed. Note that this is an optional dependency.</li>
    </ul></li>
</ul>

Ensure that your /root/ios-config folder contains id_rsa.pub, id_rsa, certificate.p12, and testobject.mobileprovision files. These will be needed to start the iOS pool.

Now in your iOS pool configuration folder start the iOS pool container:

    docker-compose up -d

<h5>Connect Devices</h5>

We can now add device information into the database using the TestObject SAK tool. If you haven't already done this for the Android pool, run the following command to insert standard device information to the database:

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak \ populateDeviceDescriptors


Let us add a device to the pool now

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak device -c create -poolId pool-[your pool name] -deviceDescriptorId [your ios device] -phoneId [phone Identifier] -wifiName [your wifi] -wifiPassword [1234qwer] -osxHost [host ip] -osxSSHPort 22 -osxUser ios -osxAppiumPort 14000

The phoneId is the UDID of the iOS device. Also, osxHost is the ip address of your OS X Host.

<h4 id="app-install">App Installation</h4>

Now we are switching host machines to install the TestObject Web UI. Therefore we have to repeat the <a href="#docker">docker installation</a> before we may continue.

<h5>Create the App Container</h5>

Navigate to App configuration folder and open docker-compose.yml in your text editor. You will need to modify the following fields:

<ul>
  <li>env.host.name<ul>
    <li>This is the domain name or ip of the host machine.</li>
    </ul></li>
  <li>web.baseurl<ul>
    <li>This is url where the webapp will be reached.</li>
    </ul></li>
  <li>mongo.hostname<ul>
    <li>This is the domain name or ip of the mongo host.</li>
    </ul></li>
</ul>

Now with docker-compose.yml properly configured, you can start the App container. Make sure you are in your App configuration folder and run:

    docker-compose up -d

<h5>Create the Monitoring Container</h5>

Navigate to your Monitoring configuration folder and open docker-compose.yml in your text editor. You will need to modify the following fields:

<ul>
  <li>mongo.hostname<ul>
    <li>This is the domain name or ip of the mongo host.</li>
    </ul></li>
</ul>

Now with docker-compose.yml properly configured, you can start the Monitoring container. Make sure you are in your Monitoring configuration folder and run:

    docker-compose up -d

<h5>Populate App database</h5>

    docker run --rm --link testobject-mongo:mongo quay.io/testobject/sak populateAppDatabase

<h5>Create your first user</h5>

    docker run --rm --link testobject-mongo:mongo --link testobject-app:app quay.io/testobject/sak user -c create -username admin -password [your password] -email [your@email.com] -firstName [John] -lastName [Doe]

<h4>Begin Testing</h4>
Your On-Premise setup is now accessible, and you're ready to begin testing! Open your browser and enter the app host's ip address. You should see the TestObject login.
