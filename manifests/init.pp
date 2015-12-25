# == Class: emacs_contextmenu
#
# Full description of class emacs_contextmenu here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'emacs_contextmenu':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Jim Hansson, unless otherwise noted.
#
class emacs_contextmenu($path = 'C:\ProgramData\chocolatey\lib\Emacs\tools') {
  registry::value { 
    # For some reason I need to prefix key with 32: have not got any good explaination for
    # that but it works, I am guessing that if i was to write to a key that is hidden
    # behind WOW64 it would be redirected there.
    'Emacs Context Menu':
      key => '32:HKEY_CLASSES_ROOT\*\shell\openwemacs',
      # swedish windows hides this behind (Standard), found out how to do this by reading
      # the manifest for registry::value
      value => '(default)',
      require => Package['emacs'],
      data => "&GNU Emacs";
    'Emacs Context Menu icon':
      key => '32:HKEY_CLASSES_ROOT\*\shell\openwemacs',
      value => 'Icon',
      require => Package['emacs'],
      data => "$path\\bin\\emacs.exe,0";
    'Emacs Context Menu command':
      key => '32:HKEY_CLASSES_ROOT\*\shell\openwemacs\command',
      value => '(default)',
      require => Package['emacs'],
      data => "$path\\bin\\emacsclientw.exe \"%1\"";
  }
}
