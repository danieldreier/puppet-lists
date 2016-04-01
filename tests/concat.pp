# tests for the lists::concat function

notice('testing lists::concat')

with('foo', 2, false, 1.5, 'foo2false1.5') |$a, $b, $c, $d, $expected| {
  notice("concating ${a}, ${b}, ${c}, and ${d} should equal ${expected}")
  lists::concat($a,$b,$c,$d).assert::equal($expected)
}
