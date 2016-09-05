# About this repository #

This is the documentation site for TestObject! (http://help.testobject.com)

## How to contribute

Fork the repository, read the rest of this README file and make some changes.
Once you're done with your changes send a pull request. Thanks!

## How to edit the site

Install Ruby:

    sudo apt-get update
    sudo apt-get install build-essential

    wget -O ruby-install-0.6.0.tar.gz \
    https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
    tar -xzvf ruby-install-0.6.0.tar.gz
    cd ruby-install-0.6.0/

    sudo make install

You can make sure that Ruby is installed by writing:

    ruby-install --version

If you want to install it On Mac OS X:

    brew install ruby


Install Bundler:

    sudo gem install bundler


Install Jekyll:  

    sudo gem install jekyll


Clone the project from github:

    cd
    git clone https://github.com/testobject/help
    cd help

Update bundle inside the website directory to install the missing tools:

    bundle update

Try to run Jekyll using Bundle inside the website directory:

    bundle exec jekyll serve build

If you get any message about missing files or directories, just go ahead and create the missing directories one by one using "mkdir your/new/folder" and create the missing file using "touch your/path/fileName".


Run Jekyll:  

    bundle exec jekyll serve serve

and then open [localhost:4000](http://localhost:4000/) in your browser.

To regenerate the HTML pages automatically when you make changes to Markdown source files, use:

    bundle exec jekyll serve serve --watch  

This guide has been tested on Linux ubuntu 16.04 LTS version.
