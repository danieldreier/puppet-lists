function is_odd($num) {
  case $num % 2 {
    0: { false }
    default: { true }
  }
}

# test the assert testing function
notice(
  [[8, false], [7, true], [1, false]].each |$case| {
    mymodule::assert([$case[0], $case[1]]) |$n| {
      notice("testing if ${case[0]} is odd. Expect ${case[1]}")
      is_odd($n[0]) == $n[1]
    }
  }
)
