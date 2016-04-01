# == Class lists::params
#
# This class is meant to be called from lists.
# It sets variables according to platform.
#
class lists::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'lists'
      $service_name = 'lists'
    }
    'RedHat', 'Amazon': {
      $package_name = 'lists'
      $service_name = 'lists'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
