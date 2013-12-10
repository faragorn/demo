class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/activate?" + @user.activation_token
    @site_name = "localhost"

    mail(:to => user.email, :subject =>  "Hey There - Please finish your registration")
  end
end
