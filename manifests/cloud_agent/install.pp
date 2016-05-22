# == Class sysdig::cloud_agent::install
#
class sysdig::cloud_agent::install (
    $customerid = $::sysdig::cloud_agent::params::customerid,
    $tags = $::sysdig::cloud_agent::params::tags,
    $collector_port = undef
  ) inherits sysdig::install {
  package { 'draios-agent':
    ensure  => $::sysdig::cloud_agent::params::package_ensure,
    require => $::sysdig::install::dependencies,
  }

  concat { $::sysdig::cloud_agent::params::config_path:
    ensure         => present,
    ensure_newline => true,
    notify         => Service['dragent'],
    require        => Package['draios-agent']
  }

  concat::fragment { 'customerid':
    target  => $::sysdig::cloud_agent::params::config_path,
    content => "customerid: ${customerid}",
    order   => '00'
  }

  concat::fragment { 'tags':
    target  => $::sysdig::cloud_agent::params::config_path,
    content => "tags: ${tags}",
    order   => '01'
  }

  if $collector_port {
    concat::fragment { 'collector_port':
      target  => $::sysdig::cloud_agent::params::config_path,
      content => "collector_port: ${collector_port}",
      order   => '05'
    }
  }
}
