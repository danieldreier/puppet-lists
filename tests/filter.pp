# tests for the lists::filter function

with([1,2,3,4,5], [2,4]) |$original, $expected| {
  notice("filtering for even numbers from ${original} should equal ${expected}")
  $original.lists::filter |$n| {
    $n % 2 == 0
  }.assert::equal($expected)
}
