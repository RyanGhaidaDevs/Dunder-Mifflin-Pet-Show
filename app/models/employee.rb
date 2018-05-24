class Employee < ApplicationRecord
  belongs_to :dog
  validates :alias, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true

  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ? OR alias LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  end
end
