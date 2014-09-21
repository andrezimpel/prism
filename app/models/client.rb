class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:prism_uuid]

  # associations
  belongs_to :account
  has_many :galleries

  attr_accessor :prism_uuid


  # we don't need a password
  def password_required?
    # new_record? ? false : super
    false
  end

  # email should'nt be required
  def email_required?
    false
  end

  # set uuid
  before_create :set_uuid
  def set_uuid
    self.prism_uuid = SecureRandom.hex(10)
  end

  # client names
  def fullname
    return firstname + " " + lastname
  end
  def title
    return self.fullname
  end
end
