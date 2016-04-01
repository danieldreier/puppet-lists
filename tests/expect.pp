# test the testing function
notice(
  with([1,2,3,4]) |$x| {
    notice("in expect block: ${x}")
    $var = 'foo'
  }.mymodule::should_return('bar')
)
