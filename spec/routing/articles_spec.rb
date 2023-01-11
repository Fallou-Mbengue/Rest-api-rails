require 'rails_helper'

RSpec.describe '/articles routes' do
    it "route to article#index" do
        aggregate_failures
            expect(get '/articles').to route_to('articles#index')
            expect(get '/articles?page[number]=3').to route_to('articles#index', page:{number: 3})
        end
    end
end