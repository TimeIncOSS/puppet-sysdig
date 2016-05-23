Puppet module for installing
[Sysdig](http://www.sysdig.org/) and
[Sysdig Cloud Agent](http://support.sysdigcloud.com/hc/en-us/articles/204498905-Sysdig-Cloud-Agent-Installation)
on Ubuntu or RedHat.

This module is a fork of [`garethr/sysdig`](https://forge.puppetlabs.com/garethr/sysdig) for the following reasons:

1. EPEL module as hard dependency (not everyone may want to use `stahnma/epel` to manage that)
2. [no GPG checking](https://github.com/garethr/garethr-sysdig/pull/8)
3. Missing support for configuration & installation of the cloud agent

## Usage

### Sysdig itself

```puppet
include 'sysdig'
```

This will install sysdig as well as the apt or yum repository. On Ubuntu
this will also install the required linux kernel headers.

The class currently has only one parameter, to affect the ensure value
of the package. For instance if you want to remove sysdig you can use:

```puppet
class { 'sysdig':
  ensure => absent,
}
```

### Cloud Agent

The following will install the agent, configure it provided the settings as below and launch it as a service:

```puppet
include sysdig::cloud_agent
```

it is necessary to provide at least basic settings, e.g. via Hiera:

```yaml
sysdig::cloud_agent::install::customerid: "00000000-1111-2222-3333-444444444445"
sysdig::cloud_agent::install::tags: "app:example,region:us-east-1,environment:production"
```

#### Optional settings

```yaml
sysdig::cloud_agent::install::collector_port: 80
```

#### Application Checks

See http://support.sysdigcloud.com/hc/en-us/articles/205147903

The following example allows you to customize built-in Apache check:

```puppet
sysdig::cloud_agent::check { 'apache':
  check_module  => 'apache',
  pattern       => {
    comm => 'httpd',
  },
  conf          => {
    apache_status_url => 'http://localhost:{port}/server-status?auto'
  }
}
```
