class rpcbind::params {
   case $::osfamily {
      'RedHat': {
           case $operatingsystem {
               'Fedora': {
                   $rpcbind_package = "rpcbind"
                   $rpcbind_service = "rpcbind"
               }
               default: {
                   if ($operatingsystemrelease < 6) {
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
           $rpcbind_package = "rpcbind"
           $rpcbind_service = "rpcbind"
       }
       default: {
       }
   }
}
