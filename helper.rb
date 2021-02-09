require 'faraday'
require 'faraday_middleware'
require 'rspec/autorun'
require 'json'

module Helper
def make_get()
   url = 'https://jsonplaceholder.typicode.com/posts'
   response = Faraday.get(url)
   return response
 end
end

def parse_data()
   data = make_get().body
   return JSON.parse(data)
 end
