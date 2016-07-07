class rpcbind::params {
  case $::osfamily {
    'RedHat': {
      case $operatingsystem {
        'Fedora': {
          $rpcbind_package = "rpcbind"
          $rpcbind_service = "rpcbind"
          $rpcbind_service_provider = "default"
        }
        default: {
          if (versioncmp($operatingsystemrelease,'6') < 0) {
            $rpcbind_package = "portmap"
            $rpcbind_service = "portmap"
            $rpcbind_service_provider = "default"
          } else {
            $rpcbind_package = "rpcbind"
            $rpcbind_service = "rpcbind"
            $rpcbind_service_provider = "init"
          }
        }
      }
    }
    'Suse': {
      $rpcbind_service_provider = "default"
      case $::operatingsystem {
        'OpenSuSE': {
          $rpcbind_package = "rpcbind"
          $rpcbind_service = "rpcbind"
        }
        default: {	# SLE[SD]
          if (versioncmp($::lsbmajdistrelease,'11') < 0) {
            $rpcbind_package = "portmap"
            $rpcbind_service = "portmap"
          } else {
            $rpcbind_package = "rpcbind"
            $rpcbind_service = "rpcbind"
          }
        }
      }
    }
    'Debian': {
      $rpcbind_service_provider = "default"
      $rpcbind_package = "rpcbind"
      $rpcbind_service = "rpcbind"
    }
    default: {
      fail("rpcbind supports osfamilies RedHat, Suse, and Debian. Detected osfamily is ${::osfamily}")
    }
  }
}
