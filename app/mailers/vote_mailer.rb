class VoteMailer < ActionMailer::Base
  default from: "noreply@redditclone.com"

  def notification(vote, post)
    @vote = vote
    @post = post
    @user = @post.user
    mail(to: @user.email, subject: 'You got upvoted :D')
  end

end
