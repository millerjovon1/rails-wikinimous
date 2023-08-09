class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
def show
  @article = Article.find(params[:id])
end
def new
  # This is for the form
  @article = Article.new
end

def create
  @article = Article.new(article_params)
  if @article.save
    redirect_to article_path(@article)
  else
    # give the form back again -> new.html.erb
    render :new, status: :unprocessable_entity
  end
end

def edit
  # This is for the form
  @article = Article.find(params[:id])
end

# this does not have a view
def update
  @article = Article.find(params[:id])
  if @article.update(article_params)
    redirect_to restaurant_path(@article)
  else
    # give the form back again -> edit.html.erb
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to articles_path, status: :see_other
end

private

# strong params -> white-listing the attributes a user can give me (for security reasons)
def article_params
  params.require(:restaurant).permit(:name, :rating, :address)
end

end
