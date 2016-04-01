# tests for the lists::keyfind function

$kl1 = [
  ['a', 'k1', 'a'],
  ['b', 'k2', 'b'],
  ['c', 'k3', 'c'],
  ['d', 'k4', 'd'],
  ['e', 'k5', 'e']
  ]
$kl2 = ['b', 'k2', 'b']

with($kl1, $kl2) |Array $original, Array $expected| {
  notice("searching for key k2 from ${original} should equal ${expected}")
  lists::keyfind('k2', 2, $original).assert::equal($expected)
}
