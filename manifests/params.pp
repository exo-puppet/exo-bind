# Class: bind::params
#
# This class manages the bind parameters for different OS
class bind::params {
	
	$ensure_mode = $bind::lastversion ? {
		true => latest,
		default => present
	}
	info ("bind ensure mode = $ensure_mode")
	

	case $::operatingsystem {
		/(Ubuntu|Debian)/: {
            $package_name       = ["bind9"]
            $service_name       = "bind9"
            $configuration_dir  = "/etc/bind"
		}
		default: {
			fail ("The ${module_name} module is not supported on $::operatingsystem")
		}
	}
}
