class SaveFilm < ApplicationRecord
    self.primary_key = "external_film_id"
    has_many :user_save_films, dependent: :destroy
    has_many :users, through: :user_save_films ,dependent: :destroy
  
    validates :external_film_id, presence: true, numericality: { only_integer: true }, uniqueness: true
    validates :is_watched
  end
  