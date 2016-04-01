Puppet::Functions.create_function(:'lists::min') do
  dispatch :min do
		param 'Array[Numeric]', :args
  end

  def min(args)
    args.reduce {|x, y| x <= y ? x : y }
  end
end
