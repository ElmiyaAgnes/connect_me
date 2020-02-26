class UserPost < ApplicationRecord
  belongs_to :post
  belongs_to :user

  enum type: { owner: 1, shared: 0 }
end
