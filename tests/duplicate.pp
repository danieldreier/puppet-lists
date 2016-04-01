# tests for the lists::duplicate function

notice('testing lists::duplicate')

with('foo', 3, ['foo','foo','foo']) |$elem, $num, $expected| {
  notice("duplicating ${elem} ${num} times should equal ${expected}")
  lists::duplicate($elem, $num).assert::equal($expected)
  $elem.lists::duplicate($num).assert::equal($expected)
}
with('foo', 0, []) |$elem, $num, $expected| {
  notice("duplicating ${elem} ${num} times should equal ${expected}")
  lists::duplicate($elem, $num).assert::equal($expected)
}
