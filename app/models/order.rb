class Order < ActiveRecord::Base
  include AASM

  # associations
  belongs_to :account
  belongs_to :client
  belongs_to :shopping_cart


  # assam
  aasm :column => 'state' do # default column: aasm_state
    state :incomplete, :initial => true
    state :open
    state :paid
    state :completed
    state :canceled
    state :returned

    event :open_up do
      transitions :from => :incomplete, :to => :open
    end
    event :purchase do
      transitions :from => :open, :to => :paid
    end
    event :finish do
      transitions :from => :paid, :to => :completed
    end


    event :cancel do
      transitions :from => :open, :to => :canceled
    end
    event :return do
      transitions :from => :completed, :to => :returned
    end
  end
end
