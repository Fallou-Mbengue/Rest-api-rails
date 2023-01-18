require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "#index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "returns a proper JSON" do
        article =  create :article
        get :index
        body = JSON.parse(response.body).deep_symbolize_keys
        pp body
        expect(body).to  eq(
            data: [
                {
                    id: article.id.to_s,
                    type: 'article',
                    attributes: {
                        title: article.title,
                        content: article.content,
                        slug: article.slug
                    }
                }
            ]
        )
    end
    
  end
end
