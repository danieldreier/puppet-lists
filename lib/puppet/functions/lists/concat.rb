# Concatenates the text representation of the elements of Things.
# The elements of Things can be atoms, integers, floats or strings.
Puppet::Functions.create_function(:'lists::concat') do
  dispatch :join do
    repeated_param 'Variant[Integer, Float, String, Boolean]', :item
  end

  def join(*items)
    items.join
  end
end
