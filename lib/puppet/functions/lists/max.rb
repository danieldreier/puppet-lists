Puppet::Functions.create_function(:'lists::max') do
  dispatch :max do
		param 'Array[Numeric]', :args
  end

  def max(args)
    args.reduce {|x, y| x >= y ? x : y }
  end
end
