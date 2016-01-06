# emacs_contextmenu

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with emacs_contextmenu](#setup)
    * [What emacs_contextmenu affects](#what-emacs_contextmenu-affects)
    * [Beginning with emacs_contextmenu](#beginning-with-emacs_contextmenu)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Adds emacs as way to open file on context menu.

## Module Description

## Setup

### What emacs_contextmenu affects

* registry

### Beginning with emacs_contextmenu

## Usage

Use, require or include the class emacs_contextmenu, it will update the registry to add
emacs as a option on the context menu of files, you need to supply a path that tells it
where emacs is installed, that variable is named path

so something like this could work
  class { 'emacs_contextmenu': path => '<path to emacs isntall without bin>' }

## Reference

## Limitations
 
Only works on windows, needs puppetlabs-registry

## Development

Send me a pull-request, if you have changes. Found a issue, go to github and post it
there. or send me a email.

## Release Notes/Contributors/Etc **Optional**

### V 0.1.0 inital version

