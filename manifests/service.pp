# == Class lists::service
#
# This class is meant to be called from lists.
# It ensure the service is running.
#
class lists::service {

  service { $::lists::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
