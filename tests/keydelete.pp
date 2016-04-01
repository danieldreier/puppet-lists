# tests for the lists::keydelete function

$kl1 = [
  ['a', 'k1', 'a'],
  ['b', 'k2', 'b'],
  ['c', 'k3', 'c'],
  ['d', 'k4', 'd'],
  ['e', 'k5', 'e']
  ]
$kl2 = [
  ['a', 'k1', 'a'],
  ['c', 'k3', 'c'],
  ['d', 'k4', 'd'],
  ['e', 'k5', 'e']
  ]

with($kl1, $kl2) |Array $original, Array $expected| {
  notice("removing key k2 from ${original} should equal ${expected}")
  lists::keydelete('k2', 2, $original).assert::equal($expected)
}
