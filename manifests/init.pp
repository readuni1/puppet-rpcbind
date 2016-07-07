class rpcbind {
include rpcbind::params
  package { $::rpcbind::params::rpcbind_package: ensure => latest }
  service { $::rpcbind::params::rpcbind_service:
    ensure   => running,
    enable   => true,
    provider => $::rpcbind::params::rpcbind_service_provider,
    require  => Package[$::rpcbind::params::rpcbind_package]
  }
}
