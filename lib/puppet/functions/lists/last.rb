Puppet::Functions.create_function(:'lists::last') do
  dispatch :last do
    param 'Array', :array
  end

  def last(array)
    array.last
  end
end
