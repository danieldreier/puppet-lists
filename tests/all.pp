# tests for the lists::all function

[2,4,6,8].assert::true |$input| {
  notice('positive test of lists:all with even numbers')
  $input.lists::all |$n| {
    $n % 2 == 0
  }
}

[2,4,6,8].assert::false |$input| {
  notice('negative test of lists:all with even numbers')
  $input.lists::all |$n| {
    $n % 2 != 0
  }
}

[[1,2,3],[4,5,6]].assert::true |$input| {
  notice('positive test of lists::all with nested arrays')
  $input.lists::all |$n| {
    $n.count == 3
  }
}

[[3, 4, 5],[4,5,6]].assert::true |$input| {
  notice('negative test of lists::all with nested arrays')
  $input.lists::all |$n| {
    member($n, 4)
  }
}

[[1,2,3],[4,5,6]].assert::false |$input| {
  notice('negative test of lists::all with nested arrays')
  $input.lists::all |$n| {
    member($n, 3)
  }
}
