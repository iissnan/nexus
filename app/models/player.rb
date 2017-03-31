class Player < ApplicationRecord
  before_save :downcase_email
  before_save :downcase_name

  has_and_belongs_to_many :matches,
                          join_table: 'players_matches'
  has_and_belongs_to_many :teams,
                          join_table: 'players_teams'

  has_secure_password

  def to_param
    name
  end

  validates :name,  presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /@/ }
  validates :sn, uniqueness: { allow_blank: true, case_sensitive: false }
  validates :password, length: { minimum: 6 }

  private

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

  def downcase_name
    self.name = self.name.delete(' ').downcase
  end
end
