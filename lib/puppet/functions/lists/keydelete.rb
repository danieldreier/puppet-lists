# keydelete(Key, N, TupleList1) -> TupleList2
#
# Returns a copy of TupleList1 where the first occurrence of a tuple whose Nth
# element compares equal to Key is deleted, if there is such a tuple.
#
# The purpose of the lists::key* functions is to make it easier to work with
# deeply nested data structures
#
Puppet::Functions.create_function(:'lists::keydelete') do
  dispatch :keydelete do
    param 'NotUndef', :key
    param 'Integer', :n
    param 'Array[Array]', :list
  end

  def keydelete(key, n, list)
    list.each_with_index do |sublist,index|
      if sublist[(n - 1)] == key
        list.delete_at((index))
        return list
      end
    end
  end
end
