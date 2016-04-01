Puppet::Functions.create_function(:'mymodule::reverse') do
  dispatch :reverse_array do
    param 'Array', :array
  end

  def reverse_array(array)
    array.reverse
  end
end
