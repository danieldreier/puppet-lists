# Returns a list in which all the sub-lists of ListOfLists have been appended
Puppet::Functions.create_function(:'lists::append') do
  dispatch :append_array do
    param 'Array', :array
  end

  dispatch :append_arrays do
    repeated_param 'Array', :arrays
  end

  def append_arrays(*arrays)
    arrays.inject {|a, acc| a + acc }
  end
  def append_array(array)
    array.inject {|a, acc| a + acc }
  end
end
