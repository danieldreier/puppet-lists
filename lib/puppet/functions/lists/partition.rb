# partition(Pred, List) -> {Satisfying, NotSatisfying}
#
# Types:
#
# Pred = fun((Elem :: T) -> boolean())
# List = Satisfying = NotSatisfying = [T]
# T = term()
# Partitions List into two lists, where the first list contains all elements for which Pred(Elem) returns true, and the second list contains all elements for which Pred(Elem) returns false.
#
# Examples:
#
# > lists:partition(fun(A) -> A rem 2 == 1 end, [1,2,3,4,5,6,7]).
# {[1,3,5,7],[2,4,6]}
# > lists:partition(fun(A) -> is_atom(A) end, [a,b,1,c,d,2,3,4,e]).
# {[a,b,c,d,e],[1,2,3,4]}
# See also splitwith/2 for a different way to partition a list.
Puppet::Functions.create_function(:'mymodule::partition') do
  dispatch :partition do
    param 'Array[Any]', :array
    required_block_param 'Callable[1,1]', :block
  end

  def partition(array)
    true_set  = []
    false_set = []
    array.each { |x|
      if yield(x)
        true_set << x
      else
        false_set << x
      end
    }
    return [true_set, false_set]
  end
end
