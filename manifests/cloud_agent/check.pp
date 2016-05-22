# == sysdig::cloud_agent::check
#
define sysdig::cloud_agent::check ($check_module, $pattern, $conf, $enabled = true) {
  include ::sysdig::cloud_agent::params

  ensure_resource('concat::fragment', 'app_checks', {
    target  => $::sysdig::cloud_agent::params::config_path,
    content => 'app_checks:',
    order   => '10'
  })

  concat::fragment { $name:
    target  => $::sysdig::cloud_agent::params::config_path,
    content => template("${module_name}/dragent.check.yaml.erb"),
    order   => '30'
  }
}
