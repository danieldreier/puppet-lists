# == Class lists::install
#
# This class is called from lists for install.
#
class lists::install {

  package { $::lists::package_name:
    ensure => present,
  }
}
