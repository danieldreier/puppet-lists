Puppet::Functions.create_function(:'lists::filtermap') do
  dispatch :filtermap do
    param 'Array[Any]', :array
    required_block_param 'Callable[1,1]', :block
  end

  def filtermap(array)
    enumerator = array.each
    array.map {|x|
      yield(enumerator.next)
    }
  end
end
