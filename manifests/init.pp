# == Class: sysdig
#
# Install sysdig, the system-level exploration tool
#
# === Parameters
#
# [*ensure*]
#   What version of sysdig is required, defaults to latest
#
class sysdig (
  $ensure = $sysdig::sysdig::params::ensure,
) inherits sysdig::sysdig::params {

  validate_string($ensure)

  class { 'sysdig::sysdig': ensure => $ensure } ->
  Class['sysdig']
}
