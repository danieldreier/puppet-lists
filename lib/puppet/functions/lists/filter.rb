# List2 is a list of all elements Elem in List1 for which Pred(Elem) returns true.
Puppet::Functions.create_function(:'lists::filter') do
  dispatch :filter do
    param 'Array[Any]', :array
    required_block_param 'Callable[1,1]', :block
  end

  def filter(array)
    array.delete_if {|x| ! yield(x) }
  end
end
