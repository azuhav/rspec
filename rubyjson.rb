require './helper'
require 'rspec/autorun'

RSpec.configure do |c|
  c.include Helper
end

RSpec.describe 'status code' do
    it 'GET returns correct status code' do
	  expect(make_get().status).to eq 200
    end
 end
 
RSpec.describe 'verify method GET' do
    let(:text) { parse_data() }
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