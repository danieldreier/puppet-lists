# delete(List1, Elem) -> List2
#
# Types:
#
# Returns a copy of List1 where the first element matching Elem is deleted, if
# there is such an element.
Puppet::Functions.create_function(:'lists::delete') do
  dispatch :delete_at do
    param 'Array', :list
    param 'Any', :elem
  end

  def delete_at(list, elem)
    list.delete_at(list.index(elem) || list.length)
    return list
  end
end
