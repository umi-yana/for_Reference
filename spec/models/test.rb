def fib(n)
  if n < 2
    return n
  else
    return fib(n - 2) + fib(n - 1);
  end

  .each do |i|
  put(i)
  end
end
