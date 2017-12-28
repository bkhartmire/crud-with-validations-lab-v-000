class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :released, inclusion: { in: %w(true, false) }
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, presence: true, if: Proc.new {|a| a.released? }
  validates :artist_name, presence: true

end
