class Client < ApplicationRecord
  belongs_to :user, optional: true # belongs_to :counselor, :class_name: 'User'
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/}

  has_many :family_members
  accepts_nested_attributes_for :family_members, allow_destroy: true

  def to_s
    "#{first_name} #{last_name}"
  end

  def age()
  	now = Time.now.utc.to_date
  	now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
