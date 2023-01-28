class Post < ApplicationRecord
    belongs_to :group
    has_many :comments

    belongs_to :user

    has_many :replies, through: :comment
end
