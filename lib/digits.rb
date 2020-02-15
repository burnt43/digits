module Digits
  module Generator
    class << self
      def each_digit_combo(number_of_digits, base: 10, offset: 0)
        ruby_code = StringIO.new

        number_of_digits.times.map do |n|
          ruby_code.puts("(#{0+offset}..#{(base-1) + offset}).each do |digit_#{n}|")
        end     

        ruby_code.print("yield(")
        ruby_code.print(
          number_of_digits.times.map{ |n| "digit_#{n}" }.join(',')
        ) 
        ruby_code.puts(")")

        number_of_digits.times do |n|
          ruby_code.puts("end")
        end

        ruby_code.string

        eval(ruby_code.string)
      end
    end
  end
end
