class User < ActiveRecord::Base
  enum role: [:free, :paid, :prof, :iadmin, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :tests
  has_one :institute
  def set_default_role
    self.role ||= :free
  end
  
  def not_student?
    self.prof? or self.iadmin? or self.admin?
  end
  def is_paid?
    self and self.institute and not self.iadmin?
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
