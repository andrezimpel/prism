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
    if self.firstname != nil && self.lastname != nil
      return self.firstname + " " + self.lastname
    end
    return self.email
    return self.email
  end
end
