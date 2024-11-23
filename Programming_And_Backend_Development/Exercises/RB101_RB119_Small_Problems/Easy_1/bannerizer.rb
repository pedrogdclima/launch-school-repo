=begin
Write a method that will take a short line of text, and print it within a box.

Example

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

You may assume that the input will always fit in your terminal window.
=end

def print_in_box(string)
    string_length = string.size
    puts line_1 = "+-#{'-'*string_length}-+"
    puts line_2 = "| #{' '*string_length} |"
    puts line_3 = "| #{string} |"
    puts line_2
    puts line_1
end

print_in_box('example')
print_in_box('Curiosity')
print_in_box('')