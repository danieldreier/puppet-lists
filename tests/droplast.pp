# tests for the lists::droplast function

notice('testing lists::droplast')

with([2,3,5,7], [2,3,5]) |$original, $expected| {
  notice("dropping the last element of ${original} should equal ${expected}")
  $original.lists::droplast.assert::equal($expected)
}
