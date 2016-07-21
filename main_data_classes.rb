def sum_number_digits(number)
  sum = 0
  number.to_s.chars.map {|el| el.to_i}.each {|el| sum+=el}
  puts sum
end

sum_number_digits(15113546886)

def max_length_digits_row(string)
  puts string.gsub(/[a-z]/, ' ').split.map{|el| el.length}.max
end

max_length_digits_row('vnrhp389hjnbt34tg4hgnb234485779nwkn')

def max_digit(string)
  puts string.gsub(/[a-z]/, ' ').split.map{|el| el.to_i}.max
end

max_digit('vnrhp389hjnbt34tg4hgnb234485779nwkn')

def number_of_first_matching_chars(string1, string2)
  a = string1.chars
  b = string2.chars

  c = []
  c << a.length << b.length
  puts num = c.min

  res = []
  i = 0
  while i < num
    res << (a[i].eql? b[i])
    i+=1
  end

  puts res

  index = 0
  count = 0
  while res[index].eql? true
    count += 1
    index +=1
  end

  puts count

end

number_of_first_matching_chars('veriwbg948tk5ng', 'veriwnv8rbg948tkknjk5ng')

def put_even_then_odd_indexes(integer_array)
  num = integer_array.length
  even_indexes = []
  odd_indexes = []
  i = 0
  while i < num
    even_indexes << integer_array[i]
    i += 2
  end
  index = 1
  while index < num
    odd_indexes << integer_array[index]
    index += 2
  end

  new_array = even_indexes.concat odd_indexes
  puts new_array
end

put_even_then_odd_indexes([1, 4, 3, 7, 90, 42, 1, 2, 6, 7, 2452, 56])

def put_index_of_last_element(ary)
  num = ary.length
  matching_elements = []
  i = 1
  while i < num
    if ary[0] < ary[i] && ary[i] < ary[-1]
      matching_elements << ary[i]
    else
      nil
    end
    i+=1
  end
  puts ary.rindex(matching_elements.last)
end

put_index_of_last_element([1, -4, 3, 7, -90, 42, 78, 1, 22, 6, 7, 2452, 156])

def add_first_element_to_each(ary)
  even_elements = ary.each.select{|i| i.even?}
  num = even_elements.length
  new_ary = []
  i = 0
  while i < (num - 1)
    new_ary << even_elements[i] + ary[0]
    i += 1
  end
  puts new_ary
end

add_first_element_to_each([1, -4, 3, 7, -90, 42, 78, 1, 22, 6, 7, 2452, 156])