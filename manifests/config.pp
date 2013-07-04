# Class: bind::config
#
# This class manages bind configuration
class bind::config {
  # configure agent daemon/service to start at boot time or not
  case $::operatingsystem {
    /(Ubuntu|Debian)/ : {
      file { '/etc/bind/named.conf.options':
        ensure  => file,
        owner   => root,
        group   => bind,
        mode    => 0644,
        content => template('bind/named.conf.options.erb'),
        require => Class['bind::install'],
        notify  => Class['bind::service'],
      }
    }
    default           : {
      fail("The ${module_name} module is not supported on ${::operatingsystem}")
    }
  }
}
