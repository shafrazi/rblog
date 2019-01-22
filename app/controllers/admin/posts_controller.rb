class Admin::PostsController < Admin::ApplicationController
  def index
    if params[:search]
      @posts = Post.search(params[:search]).all.order("created_at DESC").paginate(per_page: 2, page: params[:page])
    else
      @posts = Post.all.order("created_at DESC").paginate(per_page: 2, page: params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @page_title = "Add new post"
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created"
      redirect_to admin_posts_path
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post updated"
      redirect_to admin_posts_path
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted"
    redirect_to admin_posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :category_id, :user_id, :tags, :body, :image)
      #code
    end
end
