# == Class sysdig::sysdig::install
#
class sysdig::sysdig::install inherits sysdig::install {
  package { 'sysdig':
    ensure  => $::sysdig::sysdig::ensure,
    require => $::sysdig::install::dependencies,
  }
}
