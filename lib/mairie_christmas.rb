require 'rubygems'
  require 'nokogiri'
    require 'open-uri'

def get_townhall_email(url)
  page = Nokogiri::HTML(URI.open(url))

  email = page.xpath("//td[contains(text(),'@')]").text
end

def get_townhall_urls
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

  url = page.xpath('//td[1]/p/a/@href | //td[2]/p/a/@href | //td[3]/p/a/@href')
  
  url_array = url.collect(&:text)
  
  emails = Hash.new
  townhall_url = url_array.map {|x| "https://www.annuaire-des-mairies.com" + x[1..-1]}
  for i in 0...url_array.length
    email = get_townhall_email(townhall_url[i])
    emails[page.css('a.lientxt')[i].children.text] = email
  end
  p [].push emails
end

def perform
  get_townhall_urls
end 

perform