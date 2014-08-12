ABALookupBox
============

Development/Production virtual machine for the ABALookup project

Getting Started
===============

#### Install Vagrant
Download and install Vagrant from the [Vagrant Downloads Page](http://www.vagrantup.com/downloads.html).

#### Install VirtualBox
Download and install VirtualBox to run the virtual machine from the [VirtualBox Wiki](https://www.virtualbox.org/wiki/Downloads).

#### Get the Project
From the directory you wish to download the repository

    git clone https://github.com/MUNComputerScienceSociety/ABALookupBox.git

#### Install the Box
Start up your favourite command line and change into the ABALookupBox directory. From that directory run:

    vagrant up

#### Host Setup
You will need to add `0.0.0.0 abalookup.dev` to your systems hosts file. This file is located in `/etc/hosts` on most *nix systems. Instructions for most operating systems an be found in the [Rackspace Knowledge Center](http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file).

#### Build ABA Lookup
TODO: Add instructions for building the lookup project.

#### Test
Point your browser to http://abalookup.dev:9080 and https://abalookup:9443. 

**Note: When testing the secure site you will need to bypass the certificate error.**