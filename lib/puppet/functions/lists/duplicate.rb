# Returns a list which contains N copies of the term Elem
Puppet::Functions.create_function(:'lists::duplicate') do
  dispatch :duplicate do
    param 'Any', :elem
    param 'Integer', :num
  end

  def duplicate(elem, num)
    result = []
    num.times {
      result << elem
    }
    return result
  end
end
