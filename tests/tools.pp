# this file contains utility functions for testing the functions in the lists module

# simple function to pass into functions that accept blocks
function is_odd($num) {
  case $num % 2 {
    0: { false }
    default: { true }
  }
}
