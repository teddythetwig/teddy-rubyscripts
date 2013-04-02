(20..50).to_a.each do |n|
  tempN = n
  for i in 0..100
    print tempN
    if tempN % 2 == 0
      tempN = tempN/2
    else
      tempN = (tempN*3) + 1
    end
  end
  puts "#{tempN}\n"
end
