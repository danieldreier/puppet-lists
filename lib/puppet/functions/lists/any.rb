# Returns true if Pred(Elem) returns true for at least one element Elem in List
Puppet::Functions.create_function(:'lists::any') do
  dispatch :any do
    param 'Array[Any]', :array
    required_block_param 'Callable[1,1]', :block
  end

  def any(array)
    enumerator = array.each
    array.size.times do
      # return true if any of the results are true
      return true if yield(enumerator.next)
    end
    # otherwise return false
    false
  end
end
