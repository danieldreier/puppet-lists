# tests for the lists::keymember function

$kl1 = [
  ['a', 'k1', 'a'],
  ['b', 'k2', 'b'],
  ['c', 'k3', 'c'],
  ['d', 'k4', 'd'],
  ['e', 'k5', 'e']
  ]

with($kl1, true) |Array $original, Boolean $expected| {
  notice("searching for key 2 from ${original} should equal ${expected}")
  lists::keymember('k2', 2, $original).assert::equal($expected)
}

with($kl1, false) |Array $original, Boolean $expected| {
  notice("searching for non-existent key 'NOPE' from ${original} should equal ${expected}")
  lists::keymember('NOPE', 2, $original).assert::equal($expected)
}
