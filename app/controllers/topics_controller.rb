class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic,only:[:edit, :update, :destroy,:show]

  def index
    @topics = Topic.all
     respond_to do |format|
    format.html
    format.js
    end
  end


  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
    redirect_to topics_path, notice: "投稿しました"
    NoticeMailer.sendmail_topic(@topic).deliver
    else
    render 'new'
    end
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    redirect_to topics_path, notice:"編集しました"
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice:"削除しました"
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  private
   def topics_params
     params.require(:topic).permit(:content,:imageurl, :imageurl_cache)
   end

   def set_topic
     @topic = Topic.find(params[:id])
   end
 end
