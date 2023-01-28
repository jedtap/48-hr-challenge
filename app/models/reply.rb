class Reply < ApplicationRecord
    belongs_to :comment
    has_one :post, through: :comment
end
