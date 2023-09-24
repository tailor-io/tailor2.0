class Experience < ApplicationRecord
  has_many :experience_descriptions, dependent: :destroy
end
