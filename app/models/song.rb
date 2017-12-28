class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :artist_name && :release_year}
  validates :released, inclusion: { in: %w(true, false) }
  validates :release_year, numericality: true, presence: true, if: Proc.new {|a| a.released? }
  validates :artist_name, presence: true

end
