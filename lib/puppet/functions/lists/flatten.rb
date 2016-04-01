Puppet::Functions.create_function(:'mymodule::flatten') do
  dispatch :flatten_arrays do
    repeated_param 'Array', :arrays
  end

  def flatten_arrays(*arrays)
    arrays.flatten
  end
end
