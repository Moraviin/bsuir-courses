require 'rubygems'
require 'mechanize'
class Names
  def self.load_names
    array_of_famous = []
    agent = Mechanize.new
    source = 'http://www.imdb.com/list/ls072706884/' 
    agent.get(source)
    famous = agent.page.css('b').to_s.gsub(/<[^<^>]+>/) { '_' }
    famous = famous.gsub(/^_+/) { '' }
    famous = famous.gsub(/_+$/) { '' }
    famous = famous.gsub(/_+/) { '|' }
    array_of_famous = famous.split('|')
    array_of_famous
  end
end
