require 'rubygems' # optional for Ruby 1.9 or above.
require 'premailer'

premailer = Premailer.new('index.html', :warn_level => Premailer::Warnings::SAFE)

File.open("final.html", "w") do |fout|
  fout.puts premailer.to_inline_css
end

premailer.warnings.each do |w|
  puts "#{w[:message]} (#{w[:level]}) may not render properly in #{w[:clients]}"
end