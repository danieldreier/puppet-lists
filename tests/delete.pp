# tests for the lists::delete function

notice('testing lists::delete')

with([2,3,4,5,7], 4, [2,3,5,7]) |$original, $delete, $expected| {
  notice("removing ${delete} from ${original} should equal ${expected}")
  $original.lists::delete($delete).assert::equal($expected)
}

notice('only the first occurrence of the element should be deleted')
with([2,2,3,3], 2, [2,3,3]) |$original, $delete, $expected| {
  notice("removing ${delete} from ${original} should equal ${expected}")
  $original.lists::delete($delete).assert::equal($expected)
}
