class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable, :authentication_keys => [:prism_uuid]

  # associations
  belongs_to :account
  has_many :galleries
  has_many :shopping_carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true

  #attr_accessor :prism_uuid


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
    return firstname + " " + lastname if self.lastname != nil && self.lastname != nil
  end
  def title
    return self.fullname
  end



  # inviteable stat
  def status
    return 'invited' if self.invitation_token
    return 'active' if self.last_sign_in_at
    return 'uninvited'
  end

  def is_active?
    if self.status  == "active"
      return true
    end
    return false
  end

  def is_invited?
    if self.status  == "invited"
      return true
    end
    return false
  end



  # current shopping cart
  # current cart
  def current_shopping_cart
    return shopping_carts.last
  end

  def last_address
    self.addresses.last
  end
end
