class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # role : customer, delivery, adviser, merchant, admin
  validates_presence_of :role
  validates_inclusion_of :role, in: ['Customer', 'Delivery', 'Adviser', 'Merchant', 'Admin']
end
