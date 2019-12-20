require_relative '../lib/exec_if'

puts 'hello'.concat(' world!').
  exec_if(:ascii_only?) { upcase }.
  exec_if("end_with?('?')") { delete_suffix('?') }.
  exec_if(Proc.new {|str| str.length >= 5 }) { delete_prefix('HEL') }.
  == 'LO WORLD!'
