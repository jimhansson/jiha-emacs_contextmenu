# == Class: emacs_contextmenu
#
# Full description of class emacs_contextmenu here.
#
# === Parameters
#
# [*path*]
#   The path to the directory containing emacs.exe and emacslientw.exe
#   It defaults to C:\ProgramData\chocolatey\lib\Emacs\tools which is only usefull for
#   those that gets emacs by using chocolatey.
#
# === Variables
#
# === Examples
#
#  class { 'emacs_contextmenu':
#    path => 'path to directory containg emacs and emacsclientw',
#  }
#
# === Authors
#
# Jim Hansson <jim.hansson@gmail.com>
#
# === Copyright
#
# Copyright 2016 Jim Hansson, unless otherwise noted.
#
class emacs_contextmenu($path = 'C:\ProgramData\chocolatey\lib\Emacs\tools') {
  registry::value {
    # For some reason I need to prefix key with 32: have not got any good explaination for
    # that but it works, I am guessing that if i was to write to a key that is hidden
    # behind WOW64 it would be redirected there.
    'Emacs Context Menu':
      key     => '32:HKEY_CLASSES_ROOT\*\shell\openwemacs',
      # swedish windows hides this behind (Standard), found out how to do this by reading
      # the manifest for registry::value
      value   => '(default)',
      require => Package['emacs'],
      data    => '&GNU Emacs';
    'Emacs Context Menu icon':
      key     => '32:HKEY_CLASSES_ROOT\*\shell\openwemacs',
      value   => 'Icon',
      require => Package['emacs'],
      data    => "${path}\\bin\\emacs.exe,0";
    'Emacs Context Menu command':
      key     => '32:HKEY_CLASSES_ROOT\*\shell\openwemacs\command',
      value   => '(default)',
      require => Package['emacs'],
      data    => "${path}\\bin\\emacsclientw.exe \"%1\"";
  }
}
