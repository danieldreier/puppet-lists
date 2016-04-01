# Returns true if Pred(Elem) returns true for all elements Elem in
# List, otherwise false.
Puppet::Functions.create_function(:'lists::all') do
  dispatch :all do
    param 'Array[Any]', :array
    required_block_param 'Callable[1,1]', :block
  end

  def all(array)
    enumerator = array.each
    array.size.times do
      # return false if any of the results are false
      return false if yield(enumerator.next) == false
    end
    # return true if all of the results were true
    true
  end
end
