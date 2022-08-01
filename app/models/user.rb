class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_many :folders, dependent: :destroy   
  has_many :albums, dependent: :destroy
  enum role: [:user, :moderator, :admin]
  # after_initialize :set_default_role, :if => :new_record?

end 
