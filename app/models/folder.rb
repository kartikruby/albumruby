class Folder < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  def photos_as_thumbnail
    photos.map do|photo|
    photo.variant(resize_to_limit:[300,300]).processed
    end
  end
end
