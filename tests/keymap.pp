# tests for the lists::keymap function
#
# Returns a list of tuples where, for each tuple in TupleList1, the Nth element
# Term1 of the tuple has been replaced with the result of calling Fun(Term1).
#
$kl1 = [
  ['a', 'k1', 'a'],
  ['b', 'k2', 'b'],
  ['c', 'k3', 'c'],
  ['d', 'k4', 'd'],
  ['e', 'k5', 'e']
  ]
$kl2 = [
  ['a', 'k1', 'A'],
  ['b', 'k2', 'B'],
  ['c', 'k3', 'C'],
  ['d', 'k4', 'D'],
  ['e', 'k5', 'E']
  ]

with($kl1, $kl2) |Array $original, Array $expected| {
  notice("keymap upcasing the third key from ${original} should equal ${expected}")
  lists::keymap(3, $original) |$key| {
    $key.upcase
  }.assert::equal($expected)
}
