class VoteMailer < ActionMailer::Base
  default from: "noreply@redditclone.com"

  def notification(post)
    @post = post
    @user = @post.user
    mail(to: @user.email, subject: 'You got upvoted :D')
  end

end
