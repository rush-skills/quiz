class InstitutePackage < ActiveRecord::Base
  belongs_to :institute
  belongs_to :package
  belongs_to :user
end
