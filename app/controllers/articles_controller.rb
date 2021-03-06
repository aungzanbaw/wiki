class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :destroy, :update]
	def index
		@articles = Article.all.order("created_at DESC")
	end

	def new
		@article = current_user.articles.build
	end

	def show
		
	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private	
		def article_params
			params.require(:article).permit(:title, :content, :user_id)
		end

		def find_article
			@article = Article.find(params[:id])
		end
end
