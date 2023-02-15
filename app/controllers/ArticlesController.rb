class ArticlesController < ApplicationController
    include Paginable
    def index
        article = Article.recent
        render json: serializer.new(article), status: :ok
        paginated = paginate(Article.recent)
        render_collection(paginated)
    end

    def show
        article = Article.find(params[:id])
        render json: serializer.new(article)
    end

    def serializer
        ArticleSerializer
    end
end