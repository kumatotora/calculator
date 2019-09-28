class Sample
  def input_number_check(number)
    #数値チェック用変数
    numbercheck = number.to_i
    numbercheck = numbercheck.to_s

    until number == numbercheck
      puts "数字を入力してください"
      number = gets.chomp
      numbercheck = number.to_i
      numbercheck = numbercheck.to_s
    end

    number.to_i
  end

  def input_operator_check(operator, equalcheck)
    operator_check = ["+","-","*","/"]

    return operator if equalcheck == true && operator == "="

    until operator_check.include?(operator)
      puts "演算子を入力してください"
      operator = gets.chomp
    end

    operator
  end
end

sample = Sample.new

puts "--------------------------------"
puts "数字を入力してください"
numbers = [sample.input_number_check(gets.chomp)]

puts "--------------------------------"
puts "演算子を入力してください"
operators = [sample.input_operator_check(gets.chomp,false)]

equal = false
until equal 
  puts "--------------------------------"
  puts "数字を入力してください"
  numbers.push(sample.input_number_check(gets.chomp))

  puts "--------------------------------"
  puts "演算子を入力してください"
  operator = sample.input_operator_check(gets.chomp,true)
  case operator
  when "+" , "-" , "*" , "/"
    operators.push(operator)
  when "="
    equal = true
  end
end

#計算
answer = numbers[0]
for count in 1 .. numbers.count-1
  case operators[count-1]
  when "+"
    answer += numbers[count]
  when "-"
    answer -= numbers[count]
  when "*"
    answer *= numbers[count]
  when "/"
    begin
    answer /= numbers[count]
    rescue ZeroDivisionError
      answer = "0で割ることはできません"
      break
    end
  end
end

puts "================================"
puts "答え"
puts answer
puts "================================"



