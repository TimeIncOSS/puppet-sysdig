# == Class sysdig::cloud_agent::params
#
class sysdig::cloud_agent::params {
  $package_ensure = installed
  $service_ensure = running
  $config_path = '/opt/draios/etc/dragent.yaml'

  $collector_port = undef
  $customerid = undef
  $tags = undef
}
