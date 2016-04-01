# dropwhile(Pred, List1) -> List2
#
# Types:
#
# Pred = fun((Elem :: T) -> boolean())
# List1 = List2 = [T]
# T = term()
# Drops elements Elem from List1 while Pred(Elem) returns true and returns the
# remaining list.
Puppet::Functions.create_function(:'lists::dropwhile') do
  dispatch :drop_while do
    param 'Array[Any]', :array
    required_block_param 'Callable[1,1]', :block
  end

  def drop_while(array)
    array.delete_if {|x| yield(x) }
  end
end
