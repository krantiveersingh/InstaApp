class Comment
  include Mongoid::Document
  field :comment, type: String
  belongs_to :post
  belongs_to :user
end
