# determine the total number of elements contained in a nested array
# this is equivalent to $array.flatten.count but is faster because a new
# flattened array does not need to be created.
function lists::flattenlength(Array $arr) {
  $arr.reduce(0) |$memo, $value| {
    case $value {
      Array:   { $memo + lists::flattenlength($value) }
      default: { $memo + 1}
    }
  }
}
