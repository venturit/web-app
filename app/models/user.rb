class User < ActiveRecord::Base
  has_many :projects
  has_many :project_collaborators
  has_many :collaborations, :through => :project_collaborators, :source =>:project
  has_many :project_data
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def admin?
    false
  end
  
  def is_collaborating?(project)
     collaborations.include?(project)
  end
end
