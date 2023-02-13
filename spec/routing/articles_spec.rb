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
        expect(json_data.length).to eq(1)
        expected = json_data.first
        aggregate_failures do
            expect(expected[:id]).to eq(article.id.to_s)
            expect(expected[:type]).to eq('article')
            expect(expected[:attributes]).to aqq(
            title: article.title,
            content: article.content,
            slug: article.slug
            )  
        end
    end

    it "returns articles in the proper order" do
      recent_article  create(:article)
      oder_article = create(:article, create_at: 1.hour.ago)
      get :index
      ids = json_data.map {|item| item[:id].to_i}
      expect(ids).to(eq([recent_article.id, older_article.id]))  
    end
    
  end
end
