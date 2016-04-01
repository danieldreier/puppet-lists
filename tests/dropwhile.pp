# tests for the lists::dropwhile function

with([1,2,3,4,5], [1,3,5]) |$original, $expected| {
  notice("removing even numbers from ${original} should equal ${expected}")
  $original.lists::dropwhile |$n| {
    $n % 2 == 0
  }.assert::equal($expected)
}

with([2, 'foo', false], [2, false]) |$original, $expected| {
  notice("removing strings from ${original} should equal ${expected}")
  $original.lists::dropwhile |$n| {
    $n =~ String
  }.assert::equal($expected)
}
