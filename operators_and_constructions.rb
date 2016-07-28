def ten_random_integers
  i = 1
  until i == 10
    num = rand(9)
    i += 1
    puts "========="
    puts num
    # case
    #   when num.odd? && num > 5
    #     puts "the number is odd"
    #     puts "the number is more than 5"
    #   when num.odd? && num < 5
    #     puts "the number is odd"
    #     puts "the number is less than 5"
    #   when num == 0
    #     puts "we've got 0"
    #   when num.even? && num > 5
    #     puts "the number is even"
    #     puts "the number is more than 5"
    #   when num.even? && num < 5
    #     puts "the number is even"
    #     puts "the number is less than 5"
    #   when num == 5
    #     puts "the number is odd"
    #     puts "the number equals to 5"
    # end
    if num.odd?
      puts "the number is odd"
    elsif num == 0
      puts "we've got 0"
    elsif num.even?
      puts "the number is even"
    end
    if num > 5
      puts "the number is more than 5"
    elsif num < 5
      puts "the number is less than 5"
    end

  end
end
  ten_random_integers