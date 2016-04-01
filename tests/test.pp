function assert($result, $comparator) {
  if $result != $comparator {
    fail("${result} != ${comparator}")
  }
  $result
}
function is_odd($num) {
  case $num % 2 {
    0: { false }
    default: { true }
  }
}

notice(
  mymodule::all([2,4,8]) |$x| {
    $x.is_odd
  }.assert(false)
)
notice(
  mymodule::any([1,2,3]) |$x| {
    $x.is_odd
  }.assert(true)
)
notice(
  mymodule::any([1,5,3]) |$x| {
    $x.is_odd
  }.assert(true)
)
# append
notice(
  mymodule::append([[1,2,3],[4,5,6]]).assert([1,2,3,4,5,6])
)
notice(
  mymodule::append([1,2,3],[4,5,6]).assert([1,2,3,4,5,6])
)
# concat
notice(
  mymodule::concat('fizz', 'buzz', 1, 2.5, false).assert('fizzbuzz12.5false')
)
# delete
notice(
  mymodule::delete(1, [1,2,3,1,2,3]).assert([2,3,1,2,3])
)
# droplast
notice(
  mymodule::droplast([1,2,3]).assert([1,2])
)
# dropwhile
notice(
  mymodule::dropwhile([1,2,3,4]) |$x| {
    $x.is_odd
  }.assert([2,4])
)
# duplicate
notice(
  mymodule::duplicate(3, 'foo').assert(['foo', 'foo', 'foo'])
)
# filter
notice(
  mymodule::filter([1,2,3,4]) |$x| {
    $x.is_odd
  }.assert([1,3])
)
# flatmap
notice(
  mymodule::flatmap([1,2,3,4]) |$x| {
    [$x,$x]
  }.assert([1,1,2,2,3,3,4,4])
)
# flatten
notice(
  mymodule::flatten([1,2,3,[4,5,6,[7,8,9]]]).assert([1,2,3,4,5,6,7,8,9])
)
# last
notice(
  mymodule::last([1,2,3]).assert(3)
)
# partition
notice(
  mymodule::partition([1,2,3,4]) |$x| {
    $x.is_odd
  }.assert([[1,3],[2,4]])
)
# reverse
notice(
  mymodule::reverse([1,2,3,4]).assert([4,3,2,1])
)
