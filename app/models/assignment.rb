class Assignment < ApplicationRecord
    belongs_to :user
    has_many :discussions
    has_many :attachfiles
end
