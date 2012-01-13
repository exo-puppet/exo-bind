################################################################################
#
#   This module manages the bind9 service.
#
#   Tested platforms:
#    - Ubuntu 11.04 Natty
#
#
# == Parameters
#   [+lastversion+]
#       (OPTIONAL) (default: false)
#       
#       this variable allows to chose if the package should always be updated to the last available version (true) or not (false) (default: false)
#
# == Modules Dependencies
#
# [+repo+]
#   the +repo+ puppet module is needed to :
#   
#   - refresh the repository before installing package (in bind9::install)
#
# == Examples
#
#   class { "bind":
#       lastversion => true,
#   }
#
################################################################################
class bind ( $lastversion = false ) {
    # parameters validation
    if ($lastversion != true) and ($lastversion != false) {
        fail("lastversion must be true or false")
    }    
    include repo
	include bind::params, bind::install, bind::config, bind::service
}