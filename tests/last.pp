# tests for the lists::last function

notice('testing lists::last')

with([2,3], 3) |$array, $expected_length| {
  notice("last(${array}) should equal ${expected_length}")
  lists::last($array).assert::equal($expected_length)
}

with([true, false], false) |$array, $expected_length| {
  notice("last(${array}) should equal ${expected_length}")
  lists::last($array).assert::equal($expected_length)
}

with([[1],[2]], [2]) |$array, $expected_length| {
  notice("last(${array}) should equal ${expected_length}")
  lists::last($array).assert::equal($expected_length)
}
