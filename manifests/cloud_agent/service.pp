# == Class sysdig::cloud_agent::service
#
class sysdig::cloud_agent::service (
  $service_enable = true,
  $service_ensure = 'running',
  $service_restart = undef
) {
  validate_bool($service_enable)

  case $service_ensure {
    true, false, 'running', 'stopped': {
      $_service_ensure = $service_ensure
    }
    default: {
      $_service_ensure = undef
    }
  }

  service { 'dragent':
    ensure  => $_service_ensure,
    enable  => $service_enable,
    restart => $service_restart,
    require => [
      Package['draios-agent'],
      Concat[$::sysdig::cloud_agent::params::config_path]
    ],
  }
}
