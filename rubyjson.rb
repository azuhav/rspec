require 'faraday'
require 'faraday_middleware'
require 'rspec/autorun'
require 'json'

class JsonHolderApiClient
 def self.make_get()
   url = 'https://jsonplaceholder.typicode.com/posts'
   data = Faraday.get(url).body
   return JSON.parse(data)
 end
end

RSpec.describe 'status code' do
    it 'GET returns correct status code' do
	  url = 'https://jsonplaceholder.typicode.com/posts'
	  response = Faraday.get(url)
	  puts 'Status code is ', response.status
	  expect(response.status).to eq 200
    end
  end
  
RSpec.describe 'verify method GET' do
    let(:text) { JsonHolderApiClient.make_get() }
    it 'returns correct some expected data' do
	  expect(text[0].has_key?('userId'))
      expect(text[0]['userId']).to eq(1)
	  expect(text[0].has_key?('id'))
	  expect(text[0]['id']).to eq(1)
	  expect(text[0].has_key?('title')) 
	  expect(text[0]['title']).to include('sunt aut facere repellat provident occaecati excepturi optio reprehenderit')
	  expect(text[0].has_key?('body')) 
	  expect(text[0]['body']).to start_with('quia et suscipit')	  
    end
end