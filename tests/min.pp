# tests for the lists::min function

notice("testing lists::min")

with([2,3], 2) |$a, $expected_length| {
  notice("min(${array}) should equal ${expected_length}")
  lists::min($a).assert::equal($expected_length)
}

with([5,2,3,-1,0], -1) |$a, $expected_length| {
  notice("min(${a}) should equal ${expected_length}")
  lists::min($a).assert::equal($expected_length)
}
