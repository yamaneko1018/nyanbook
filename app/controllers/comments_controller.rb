class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end
  
  
  def edit
    @comment = Comment.find(params[:id])
    @topic = @comment.topic
  end

  def update
    @comment = Comment.find(params[:id])
    @topic = @comment.topic
    @comment.update(comment_params)
    if @comment.save
      redirect_to topic_path(@topic), notice: "コメントを更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @topic = @comment.topic
    respond_to do |format|
      @comment.destroy
      format.html {redirect_to topic_path(@topic), 'コメントを削除しました。'}
      format.js {render :index}
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
end