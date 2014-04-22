class VotesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @votes = @post.votes.new direction: params[:direction]
    @votes.user = current_user
    @votes.save
    redirect_to '/posts'
  end

end
