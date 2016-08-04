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
  num = c.min

  res = []
  num.times {|i| res << (a[i].eql? b[i])}
  puts (res.take_while {|i| (i == true)}).length
end

number_of_first_matching_chars('veriwbg848tk5ng', 'veriwng8rbg948tkknjk5ng')

def put_even_then_odd_indexes(integer_array)
  even_indexes = []
  odd_indexes = []
  integer_array.each_index {|i| i.odd? ? odd_indexes << integer_array[i] : even_indexes << integer_array[i]}

  new_array = even_indexes.concat odd_indexes
  puts new_array
end

put_even_then_odd_indexes([1, 4, 3, 7, 90, 42, 1, 2, 6, 7, 2452, 56])

def put_index_of_last_element(ary)
  puts ary.rindex((ary.select {|i| (ary[0] < i) && (i < ary[-1])}).last)
end

put_index_of_last_element([1, -4, 3, 7, -90, 42, 78, 1, 22, 6, 7, 2452, 156])

def add_first_element_to_each(ary)
  changed_part = []
  changed_part << ary[1..-2].each.map {|i| i.even? ? (i + ary[0]) : i }
  new_ary = []
  puts new_ary << ary[0] << changed_part << ary[-1]
end

add_first_element_to_each([100, -4, 3, 7, -90, 42, 78, 1, 22, 6, 7, 2452, 156])

def modify_hash(hashy)
  var = hashy.map do |key, value|
    [key = key.to_sym,
     val = if value == "0"
           value.to_i
         elsif value.to_i == 0
           nil
         else
           value.to_i
         end]
  end.to_h
  puts var
end

modify_hash({'first_key' => "59", 'second_key' => '0', 'third_key' => 'third_value'})

def remove_pairs_started_with_s(hashy)
  puts hashy.delete_if { |key| key.to_s.start_with?('s')}
end

remove_pairs_started_with_s({:first_key => 9, :second_key => 4648, :third_key => 1})

def remove_pairs_without_natural_number(hashy)
  puts hashy.delete_if { |key, value| value < 0 || value.integer? == false}
end

remove_pairs_without_natural_number({:first_key => -9, :second_key => 46.48, :third_key => 1, :fourth_key => 1494})