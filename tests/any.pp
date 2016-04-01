# tests for the lists::any function

notice('positive tests of lists::any')
[6,9,10,15].assert::true |$input| {
  notice("at least one of ${input} is even")
  $input.lists::any |$n| {
    $n % 2 == 0
  }
  notice("at least one of ${input} are greater than 10")
  $input.lists::any |$n| {
    $n > 10
  }
}

notice('negative test of lists::any')
[2,4,6,8].assert::false |$input| {
  notice("not any of ${input} are greater than 10")
  $input.lists::any |$n| {
    $n > 10
  }
}
