# Class: bind::service
#
# This class manages the bind service
class bind::service {
  service { 'bind':
    ensure     => running,
    name       => $bind::params::service_name,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['bind::install', 'bind::config'],
  }
}
