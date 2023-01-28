class Post < ApplicationRecord
    belongs_to :group
    has_many :comments

    belongs_to :user
end
