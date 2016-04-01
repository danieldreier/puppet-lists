# Drops the last element of a List. The list should be non-empty.
Puppet::Functions.create_function(:'lists::droplast') do
  dispatch :droplast do
    param 'Array', :array
  end

  def droplast(array)
    array.pop
    return array
  end
end
