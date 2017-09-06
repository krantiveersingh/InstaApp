class Post 

	include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Attributes::Dynamic

	field :description, type: String
	field :open_to_all, type: Boolean

	belongs_to :user
	has_many :comments
	mount_uploader :image 

end
