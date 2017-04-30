class Item < ApplicationRecord
  belongs_to :user
  validates :price, presence: true
  validates :category, presence: true
  validates :item_name, presence: true
  validates :description, presence: true

  CATEGORY = ["Véhicule", "Jouet", "Multimédia", "Immobilier", "Décoration"]
end
