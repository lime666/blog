class PostsController < ApplicationController
  # impressionist
  before_action :set_post, only: %i[edit update destroy]
  before_action :ensure_current_author, except: %i[index show]

  # GET /posts or /posts.json
  def index
    @posts = Post.order('created_at DESC').page params[:page]
  end

  def search
    @posts = Post.where('title ILIKE ? or content ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    render 'index'
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    @author = @post.author
    @comments = @post.comments.all
    unless current_author
      @post.increment!(:views_count)
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = current_author.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:name, :title, :content, :image, :author_id)
  end
end
