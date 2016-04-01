# keyfind(Key, N, TupleList) -> Tuple | false
#
# Searches the list of tuples TupleList for a tuple whose Nth element compares
# equal to Key. Returns Tuple if such a tuple is found, otherwise false.
#
Puppet::Functions.create_function(:'lists::keyfind') do
  dispatch :keyfind do
    param 'NotUndef', :key
    param 'Integer', :n
    param 'Array[Array]', :list
  end

  def keyfind(key, n, list)
    list.each_with_index do |sublist,index|
      if sublist[(n - 1)] == key
        return list[index]
      end
    end
  end
end
