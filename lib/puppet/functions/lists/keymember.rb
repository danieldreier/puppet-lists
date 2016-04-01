# keymember(Key, N, TupleList) -> boolean()
# Returns true if there is a tuple in TupleList whose Nth element compares equal to Key, otherwise false.
#
Puppet::Functions.create_function(:'lists::keymember') do
  dispatch :keymember do
    param 'NotUndef', :key
    param 'Integer', :n
    param 'Array[Array]', :list
  end

  def keymember(key, n, list)
    list.each_with_index do |sublist,index|
      return true if sublist[(n - 1)] == key
    end
    return false
  end
end
