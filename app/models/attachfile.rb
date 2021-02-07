class Attachfile < ApplicationRecord
  belongs_to :user
  belongs_to :assignment

  has_one_attached :file
end
