require 'the_dude'

require 'capybara'
require 'capybara/dsl'
require 'nokogiri'
require 'net/http'

Capybara.run_server = false
Capybara.current_driver = :selenium

# TheDude is configured to use Capybara
# This means that you can use Capybara DSL shortcuts in your dude commands
#
# @example
#     command 'a web script' do
#       Capybara.app_host = 'http://www.google.com'
#       visit '/'
#     end
#
# By default this will use the selenium driver however other Capybara drivers
# can be configured as per the instructions in the [Capybara
# readme](https://github.com/jnicklas/capybara)
class TheDude::Dsl
  include Capybara::DSL
end

TheDude::Dsl.run do
  command /find (.+) on wikipedia/ do |term|
    url = "http://en.wikipedia.org/wiki/#{term}"
    body = Net::HTTP.get(URI(url))
    doc = Nokogiri::HTML(body)

    doc.css('#firstHeading span').each do |heading|
      say "#{heading.content}\n"
    end

    say "from #{url}\n\n"

    doc.css('#mw-content-text p').each do |p|
      say "#{p.content}\n\n"
    end

  end
end

