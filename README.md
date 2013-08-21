# About this repository #

This is the documentation site for TestObject! (http://help.testobject.com)

## How to contribute

Fork the repository, read the rest of this README file and make some changes.
Once you're done with your changes send a pull request. Thanks!

## How to edit the site

Install pygments for code highlighting:

    sudo apt-get install python-setuptools python-dev build-essential
    sudo easy_install Pygments

Install Ruby 1.9.1 which includes the gem command, and the make command:  

    sudo apt-get install ruby1.9.1 ruby1.9.1-dev make  
    
Install Jekyll:  

    sudo gem install jekyll  
    
Start Jekyll  

Jekyll can be run inside the website directory:  

    jekyll  

In order to run a local Web server that will serve documentation site, run:

    jekyll serve

and then open [localhost:4000](http://localhost:4000/) in your browser. 

To regenerate the HTML pages automatically when you make changes to Markdown source files, use

    jekyll serve --watch

Note that quoted entities may be escaped or unescaped depending on the Ruby
version (1.8 vs. 1.9) used. It is normal.
