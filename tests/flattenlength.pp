# tests for the lists::flattenlength function

notice('testing lists::flattenlength')

with([2,3], 2) |$array, $expected_length| {
  notice("flattenlengthing on ${array} should equal ${expected_length}")
  lists::flattenlength($array).assert::equal($expected_length)
}

with([], 0) |$array, $expected_length| {
  notice("flattenlengthing on ${array} should equal ${expected_length}")
  lists::flattenlength($array).assert::equal($expected_length)
}

with([1,2,[3,4]], 4) |$array, $expected_length| {
  notice("flattenlengthing on ${array} should equal ${expected_length}")
  lists::flattenlength($array).assert::equal($expected_length)
}

with([1,2,[3,4,[5,[6],[7]],8,[9,[10]],[11,12],[13],14],15], 15) |$array, $expected_length| {
  notice("flattenlengthing on ${array} should equal ${expected_length}")
  lists::flattenlength($array).assert::equal($expected_length)
}
