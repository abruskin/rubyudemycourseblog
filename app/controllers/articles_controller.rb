class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  
  # GET /articles or /articles.json
  def index
    @articles = Article.paginate(page: params[:page], per_page: 6)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = User.first

      if @article.save
        flash[:notice]=  "Article was successfully created." 
        redirect_to article_path(@article) 
      else
       render 'new', status: :unprocessable_entity 
        
      end
    
  end

 
  def update
    if @article.update(article_params)
      flash[:notice]="Article was updated successfully."
      redirect_to @article
    else 
      render 'edit'
    end
  end 

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_path, status: :see_other, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.expect(article: [ :title, :description ])
    end

end
