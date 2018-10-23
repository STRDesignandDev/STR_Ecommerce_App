class User < ActiveRecord::Base
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # after_create :send_welcome_email
  #  def send_welcome_email
  #    UserMailer.welcome_email(self).deliver
  #  end
end
