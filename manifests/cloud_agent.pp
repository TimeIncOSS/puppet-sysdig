# == Class sysdig::cloud_agent
#
class sysdig::cloud_agent($collector_port = $::sysdig::cloud_agent::collector_port) {
  include ::sysdig::cloud_agent::params
  include ::sysdig::cloud_agent::install
  include ::sysdig::cloud_agent::service
}
