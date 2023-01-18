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
        expect(body).to  eq(
            data: [
                {
                    id: article.id,
                    type: 'articles',
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
