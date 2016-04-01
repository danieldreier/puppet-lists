# keysort(N, TupleList1, TupleList2) -> TupleList3
#
Puppet::Functions.create_function(:'lists::keysort') do
  dispatch :keysort do
    param 'Integer', :n
    param 'Array[Array]', :list1
  end

  def keysort(n, list)
    list.sort { |x,y| x[(n-1)] <=> y[(n-1)] }
  end
end
