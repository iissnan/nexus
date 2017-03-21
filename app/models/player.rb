class Player < ApplicationRecord
  before_save :downcase_email
  before_save :downcase_name

  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_uniqueness_of :name, case_sensitive: false
  validates_format_of :email, with: /@/
  validates :password, length: { minimum: 6 }

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

  def downcase_name
    self.name = self.name.delete(' ').downcase
  end
end
