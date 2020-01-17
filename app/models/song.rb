class Song < ApplicationRecord
  belongs_to :artist
  has_and_belongs_to_many :billboards

#  rails_admin do
#    configure :artist do
#      label 'Owner of the Song: '
#    end
#  end
end
