# Class: bind::install
#
# This class manages the installation of the bind package and related utils
class bind::install {
  ensure_packages ('bind9', { 'ensure' => $bind::params::ensure_mode, 'name' => $bind::params::package_name })
}
