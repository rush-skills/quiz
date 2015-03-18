# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  role                   :integer
#  institute_id           :integer
#  image                  :string
#

class User < ActiveRecord::Base
  enum role: [:free, :paid, :prof, :iadmin, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :tests
  has_many :test_attempts
  belongs_to :institute
  validates :name, presence: true
  mount_uploader :image, ImageUploader
  def set_default_role
    self.role ||= :free
  end
  
  def not_student?
    self.prof? or self.iadmin? or self.admin?
  end
  def is_paid?
    self and self.institute and not self.iadmin?
  end
  def allowed_tests
    if self.institute
      self.institute.allowed_tests
    else
      Test.where(free: true)
    end
  end
  def to_s
    self.name
  end
  def allowed_to_take(test_id)
    if self.institute
      self.institute.allowed_tests.include? Test.find(test_id)
    else
      Test.find(test_id).free
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
