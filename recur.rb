
def count_down_from(num)
  puts num

  return if num == 1

  count_down_from(num - 1)
end

def count_up_to(num)
  return if num == 0

  count_up_to(num - 1)

  puts num
end

def recur_until_depth(num, depth)
  puts "#"*(depth) + " BEFORE: stack level #{depth}"

  recur_until_depth(num - 1, depth + 1) if num > 0

  puts "#"*(depth) + " AFTER : stack level #{depth}"
end

def recur(num)
  recur_until_depth(num, 0)
end

def puts_at_depth(depth, str)
  puts "   "*(depth) + str
end

def fib(n)
 return 1 if n == 0
 return 1 if n == 1
 return fib(n - 1) + fib(n - 2)
end

def fib_recur(n, depth)
  if n == 0
    puts_at_depth(depth, "BASE  : 0 Returning 1")
    return 1
  end
  if n == 1
    puts_at_depth(depth, "BASE  : 1 Returning 1")
    return 1
  end
  puts_at_depth(depth, "#{n} BEFORE:")
  a = fib_recur(n - 1, depth + 1)
  puts_at_depth(depth, "#{n} MIDDLE:")
  b = fib_recur(n - 2, depth + 1)
  puts_at_depth(depth, "#{n}  AFTER: Returning #{a + b}")
  return a + b
end

def fib_wrap(n)
  fib_recur(n, 0)
end

@memo = {}

def fib_recur_mem(n, depth)
  if n == 0
    puts_at_depth(depth, "0 BASE  : Returning 1")
    return 1
  end
  if n == 1
    puts_at_depth(depth, "1 BASE  : Returning 1")
    return 1
  end
  if @memo[n]
    puts_at_depth(depth, "#{n} MEMO'D: Returning #{@memo[n]}")
    return @memo[n]
  end

  puts_at_depth(depth, "#{n} BEFORE:")
  a = fib_recur_mem(n - 1, depth + 1)
  puts_at_depth(depth, "#{n} MIDDLE:")
  b = fib_recur_mem(n - 2, depth + 1)
  puts_at_depth(depth, "#{n}  AFTER: Returning #{a + b}")
  
  @memo[n] = a + b
  return a + b
end

def fib_mem_wrap(n)
  fib_recur_mem(n, 0)
end

count_down_from(10)
puts "----------"
count_up_to(7)
puts "----------"
recur(5)

puts "----------"
fib_wrap(6)
puts "----------"
fib_mem_wrap(6)
puts "----------"
fib_mem_wrap(6)
