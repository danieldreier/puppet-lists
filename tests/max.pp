# tests for the lists::max function

notice('testing lists::max')

with([2,3], 3) |$a, $expected_length| {
  notice("max(${array}) should equal ${expected_length}")
  lists::max($a).assert::equal($expected_length)
}

with([5,2,3,-1,0], 5) |$a, $expected_length| {
  notice("max(${a}) should equal ${expected_length}")
  lists::max($a).assert::equal($expected_length)
}
