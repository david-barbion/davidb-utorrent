# utorrent

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with utorrent](#setup)
    * [What utorrent affects](#what-utorrent-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with utorrent](#beginning-with-utorrent)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A quick and dirty µtorrent-server module. 

## Module Description

This module install µtorrent-server by downloading it from official build. If you want to install newer build you will to pass new download\_url and download\_md5sum.

No configuration of µtorrent is done actually. However, you can set it from µtorrent gui.

## Setup

### What utorrent affects

* µtorrent is installed in /usr/share/utorrent
* some directories are created
* a systemd daemon file is created

### Setup Requirements

You will need camptocamp-archive module to use this module.

### Beginning with utorrent

Just do 
```
include utorrent
```
It's quick and dirty.

## Usage

You can alter some directories of µtorrent:
* bin\_dir is where is located utserver
* pid\_dir is where is located pid file
* config\_dir is where is located µtorrent config
* settings\_dir is where is located runtime config

## Reference

This module can be called by only utorrent clas like:
```
include utorrent
```
That's it.

## Limitations

Currently, only systemd is supported. (Rhel7, Centos7 and Debian7). The init script for Debian 6 needs to be written.
This module contains a bad hack for Rhel7/Centos7. Those 2 releases are shipped with openssl 1.0.1 but µtorrent requires 1.0.0 (as of Debian 7). This module will deploy libssl and libcrypto 1.0.0.

## Development

Check https://github.com/david-barbion/davidb-utorrent.git for new releases.

