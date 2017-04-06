class Player < ApplicationRecord
  before_save { self.email = self.email.to_s.delete(' ').downcase }
  before_save { self.name = self.name.delete(' ').downcase }
  before_save { self.display_name = self.name unless self.display_name.nil? }

  has_and_belongs_to_many :matches,
                          join_table: 'players_matches'
  has_and_belongs_to_many :teams,
                          join_table: 'players_teams'

  def to_param
    name
  end

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, allow_blank: true, uniqueness: { case_sensitive: false }, format: { with: /@/ }
  validates :sn, uniqueness: { allow_blank: true, case_sensitive: false }
end
