class User < ActiveRecord::Base
  has_one :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  # settings
  has_settings do |s|
    s.key :galleries, :defaults => { :view => 'listing' }
    s.key :photos, :defaults => { :view => 'grid' }
  end

  # associations
  belongs_to :account

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
