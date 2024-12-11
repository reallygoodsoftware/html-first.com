class Category < ApplicationRecord
  belongs_to :user

  scope :not_draft, -> { where(draft: false) }
end
