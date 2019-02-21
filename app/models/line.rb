class Line < ApplicationRecord
    has_many :frames, dependent: :destroy
end
