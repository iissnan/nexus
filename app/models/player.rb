class Player < ApplicationRecord
  before_save { self.email = self.email.to_s.delete(' ').downcase }
  before_save { self.name = self.name.delete(' ').downcase }
  before_save { self.display_name = self.name unless self.display_name.nil? }

  has_one :serial_number, dependent: :destroy

  def to_param
    name
  end

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email,
            allow_blank: true,
            uniqueness: { case_sensitive: false },
            format: { with: /@/ }
end
