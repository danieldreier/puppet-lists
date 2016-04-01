# tests for the lists::keysort function
#
$keylist = [[1,'c'],[2,'b'],[3,'a']]
$sort_on_1 = [[1,'c'],[2,'b'],[3,'a']]
$sort_on_2 = [[3,'a'],[2,'b'],[1,'c']]

with($keylist, $sort_on_1, 1) |Array $original, Array $expected, Integer $n| {
  notice("keysort on ${n} of ${original} should equal ${expected}")
  lists::keysort($n, $original).assert::equal($expected)
}

with($keylist, $sort_on_2, 2) |Array $original, Array $expected, Integer $n| {
  notice("keysort on ${n} of ${original} should equal ${expected}")
  lists::keysort($n, $original).assert::equal($expected)
}
