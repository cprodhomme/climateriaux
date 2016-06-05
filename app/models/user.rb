class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # role : customer, delivery, adviser, merchant, admin
  validates_presence_of :role
  validates_inclusion_of :role, in: ['Customer', 'Delivery', 'Adviser', 'Merchant', 'Admin']

  has_many :tutorials

  def role_name
    case self.role
    when "Customer"
      "Client"
    when "Delivery"
      "Livreur"
    when "Adviser"
      "Conseiller"
    when "Merchant"
      "Marchand"
    when "Admin"
      "Administrateur"
    end
  end
end
