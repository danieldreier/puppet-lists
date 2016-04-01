# tests for the lists::filtermap function

with([1,2,3,4,5], [false, true, false, true, false]) |$original, $expected| {
  notice("filtermaping for even numbers from ${original} should equal ${expected}")
  $original.lists::filtermap |$n| {
    $n % 2 == 0
  }.assert::equal($expected)
}

with(['joe', 'daniel', 7], [true, true, false]) |$original, $expected| {
  notice("filtermaping for =~ String from ${original} should equal ${expected}")
  $original.lists::filtermap |$n| {
    $n =~ String[1]
  }.assert::equal($expected)
}
