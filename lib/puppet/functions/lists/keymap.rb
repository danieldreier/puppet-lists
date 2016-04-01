# keymap(Fun, N, TupleList1) -> TupleList2
#
# Returns a list of tuples where, for each tuple in TupleList1, the Nth element
# Term1 of the tuple has been replaced with the result of calling Fun(Term1).
#
Puppet::Functions.create_function(:'lists::keymap') do
  dispatch :keymap do
    param 'Integer', :n
    param 'Array[Array]', :list
    required_block_param 'Callable[1,1]', :block
  end

  def keymap(n, list)
    list.each_with_index do |sublist,index|
      sublist[(n - 1)] = yield(sublist[(n - 1)])
    end
  end
end

#  def filtermap(array)
#    enumerator = array.each
#    array.map {|x|
#      yield(enumerator.next)
#    }
#  end
