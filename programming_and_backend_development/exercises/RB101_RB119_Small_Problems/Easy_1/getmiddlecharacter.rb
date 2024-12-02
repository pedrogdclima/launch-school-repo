=begin
Write a method that takes a non-empty string argument, and returns the middle
character or characters of the argument. If the argument has an odd length,
you should return exactly one character. If the argument has an even length,
you should return exactly two characters.

Examples:

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

=end

def center_of(string)
    half_idx = string.size/2
    if string.size.odd?
        string[half_idx]
    else
        string[(half_idx-1)..half_idx]
    end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
