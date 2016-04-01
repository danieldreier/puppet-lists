# tests for the lists::keymerge function
# I don't really understand this function, so I'm basing the tests off what
# erlang actually returns for similar test cases

$kl1 = [
  ['a', 'k1', 'a'],
  ['b', 'k2', 'b'],
  ['c', 'k3', 'c'],
  ['d', 'k4', 'd'],
  ['e', 'k5', 'e']
  ]
$kl2 = [
  ['a', 'daniel', 'a'],
  ['b', 'joe', 'b'],
  ['c', 'bob', 'c'],
  ['d', 'susan', 'd'],
  ['e', 'kevin', 'e']
  ]

# lists:keymerge(1, Key1, Key2).
$result_keymerge_on_1 = [
  ['a','k1','a'],
  ['a','daniel','a'],
  ['b','k2','b'],
  ['b','joe','b'],
  ['c','k3','c'],
  ['c','bob','c'],
  ['d','k4','d'],
  ['d','susan','d'],
  ['e','k5','e'],
  ['e','kevin','e']]

# lists:keymerge(2, Key1, Key2).
$result_keymerge_on_2 = [
  ['a','daniel','a'],
  ['b','joe','b'],
  ['c','bob','c'],
  ['a','k1','a'],
  ['b','k2','b'],
  ['c','k3','c'],
  ['d','k4','d'],
  ['e','k5','e'],
  ['d','susan','d'],
  ['e','kevin','e']]

# simplest case
with([], [], [], 1) |Array $list1, Array $list2, Array[Array[String]] $expected, Integer $n| {
  notice("merging ${list1} and ${list2} on ${n} should equal ${expected}")
  lists::keymerge($n, $list1, $list2).assert::equal($expected)
}

with([[1,'foo']], [[1,'a']], [[1,'a'],[1,'foo']], 1) |Array $list1, Array $list2, Array[Array] $expected, Integer $n| {
  notice("merging ${list1} and ${list2} on ${n} should equal ${expected}")
  lists::keymerge($n, $list1, $list2).assert::equal($expected)
}

# next case, merging on field 1
with( [[1,'foo']],[[1,'a'],[2,'b'],[3,'c']],
      [[1,'foo'],[1,'a'],[2,'b'],[3,'c']], 1) |Array $list1, Array $list2, Array[Array[String]] $expected, Integer $n| {
  notice("merging ${list1} and ${list2} on ${n} should equal ${expected}")
  lists::keymerge($n, $list1, $list2).assert::equal($expected)
}

# next case, merging on field 2
with( [[1,'foo']],[[1,'a'],[2,'b'],[3,'c']],
      [[1,'a'],[2,'b'],[3,'c'],[1,'foo']], 2) |Array $list1, Array $list2, Array[Array[String]] $expected, Integer $n| {
  notice("merging ${list1} and ${list2} on ${n} should equal ${expected}")
  lists::keymerge($n, $list1, $list2).assert::equal($expected)
}

with($kl1, $kl2, $result_keymerge_on_1, 1) |Array $list1, Array $list2, Array[Array[String]] $expected, Integer $n| {
  notice("merging ${list1} and ${list2} on ${n} should equal ${expected}")
  lists::keymerge($n, $list1, $list2).assert::equal($expected)
}

with($kl1, $kl2, $result_keymerge_on_2, 2) |Array $list1, Array $list2, Array[Array[String]] $expected, Integer $n| {
  notice("merging ${list1} and ${list2} on ${n} should equal ${expected}")
  lists::keymerge($n, $list1, $list2).assert::equal($expected)
}
