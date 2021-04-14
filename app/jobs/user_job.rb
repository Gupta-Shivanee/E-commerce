class UserJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.update_email(user).deliver_now
  end
end
