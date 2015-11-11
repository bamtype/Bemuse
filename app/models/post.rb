class Post < ActiveRecord::Base
	acts_as_votable
   belongs_to :user
   has_many :comments
	
   has_attached_file :image, styles: { medium: "700x500", small: "350x250" }
 validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
   has_attached_file :photo

  # attr_accessor :image_file_name
  # attr_accessor :image_content_type
  # attr_accessor :image_file_size
  # attr_accessor :image_updated_at
end
