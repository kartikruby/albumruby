class Album < ApplicationRecord
    belongs_to :user
    has_many_attached :images,:styles => { :show => "150x150#" }, :default_url => 'missing_:style.png'
end
