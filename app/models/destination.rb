class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :history
  belongs_to :prefecture
end
