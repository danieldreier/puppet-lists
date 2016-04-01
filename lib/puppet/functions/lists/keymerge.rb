# keymerge(N, TupleList1, TupleList2) -> TupleList3
#
# Returns the sorted list formed by merging TupleList1 and TupleList2.
# The merge is performed on the Nth element of each tuple.
#
# Both TupleList1 and TupleList2 must be key-sorted prior to evaluating this
# function.
#
# When two tuples compare equal, the tuple from TupleList1 is picked before
# the tuple from TupleList2.
#
Puppet::Functions.create_function(:'lists::keymerge') do
  dispatch :keymerge do
    param 'Integer', :n
    param 'Array[Array]', :list1
    param 'Array[Array]', :list2
  end

  def keymerge(n, list1, list2)
    return list1 + list2
    return call_function('lists::keysort', n, list1 + list2)
  end
end
