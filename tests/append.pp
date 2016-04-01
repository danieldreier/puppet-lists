# tests for the lists::append function

notice('testing lists::append')

with([2,3], [5,7,11], [2,3,5,7,11]) |$a, $b, $expected| {
  notice("appending ${a} and ${b} should equal ${expected}")
  $a.lists::append($b).assert::equal($expected)
  notice("appending [${a}, ${b}] should equal ${expected}")
  lists::append([$a,$b]).assert::equal($expected)
}

with(['foo',[1]], ['bar'], ['foo',[1],'bar']) |$a, $b, $expected| {
  notice("appending ${a} and ${b} should equal ${expected}")
  $a.lists::append($b).assert::equal($expected)
  notice("appending [${a}, ${b}] should equal ${expected}")
  lists::append([$a,$b]).assert::equal($expected)
}
