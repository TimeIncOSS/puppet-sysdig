# == Class sysdig::sysdig
#
class sysdig::sysdig (
  $ensure = $sysdig::sysdig::params::ensure
) inherits sysdig::sysdig::params {
  include ::sysdig::sysdig::install
}
