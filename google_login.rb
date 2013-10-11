require 'active_support'
require 'nokogiri'
require 'mechanize'
require 'open-uri' 



puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
puts "Ok we are going to login to your google history"
puts "so we can get a better picture of who you are."
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

puts "Google Username:" 
EMAIL = gets.chomp

puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "And don't worry your info is not being stored any"
puts "where. Infact this script is running completely locally."
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

puts "Google password:"
PASSWORD = gets.chomp

LOGIN_URL = "https://accounts.google.com/Login?continue=https://history.google.com/history/&hl=en"

agent = Mechanize.new
page = agent.get("#{LOGIN_URL}")
google_form = page.form
google_form.Email = "#{EMAIL}"
google_form.Passwd = "#{PASSWORD}"
page = agent.submit(google_form)
doc = page.parser

first_history = doc.css("a#bkmk_href_0")

puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts first_history.text

y = 0
while y <= 200 
 y = y + 1
 x = y 
 todays_history = doc.css("a#bkmk_href_" + x.to_s)
 yesterdays_history = doc.css("a#bkmk_href_1" + x.to_s)
   if  todays_history.count > 0
   puts  todays_history.text
   elsif yesterdays_history.count > 0
   puts  yesterdays_history.text
   end
end  





