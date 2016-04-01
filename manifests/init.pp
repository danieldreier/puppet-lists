# Class: lists
# ===========================
#
# Full description of class lists here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class lists (
  $package_name = $::lists::params::package_name,
  $service_name = $::lists::params::service_name,
) inherits ::lists::params {

  # validate parameters here

  class { '::lists::install': } ->
  class { '::lists::config': } ~>
  class { '::lists::service': } ->
  Class['::lists']
}
