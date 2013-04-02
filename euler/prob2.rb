sum = 0
first = 1
second = 1
temp = 0
while second < 4000000
  if second % 2 == 0
    sum += second
  end
  temp = first + second
  first = second
  second = temp
end
puts sum
