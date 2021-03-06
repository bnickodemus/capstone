class User < ApplicationRecord

  devise :password_expirable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: %w(admin counselor)

  has_many :clients

  def self.find_version_counselor(version)
    begin
      find(version.terminator)
    rescue
      @error_message = "client has no counselor"
    end
  end

  #this method is called by devise to check for "active" state of the model
  def active_for_authentication?
    super and !self.is_archived? #determine "active" state using our own "is_archived" column
  end

end
