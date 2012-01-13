# Class: bind::install
#
# This class manages the installation of the bind package and related utils
class bind::install {
    package { "bind9" :
        name    => $bind::params::package_name,
        ensure  => $bind::params::ensure_mode,
        require => [ Exec ["repo-update"],],
    }
}
