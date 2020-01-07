def check(var, type)
  status = :fail
  if type == :int
    if var.to_i == var
      status = :pass
    end
  elsif type == :bool
    if var == true || var == false
      status = :pass
    end

  elsif type.class != Symbol
    # if "type" is not a symbol, then assume it's a literal check
    if var == type
      status = :pass
    end
  end


  if status == :fail
    raise "variable is #{var.class} not a #{type.to_s}"
  end
end