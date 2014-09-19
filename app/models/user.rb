class User < ActiveRecord::Base
  has_one :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # get user "Name"
  def fullname
    if self.profile
      if self.profile.firstname != nil && self.profile.lastname != nil
        return self.profile.firstname + " " + self.profile.lastname
      end
      return self.email
    end
    return self.email
  end
end