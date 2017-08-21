class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation


  private
   def image_size_validation
     errors[:image] << "should be less than 5MB " if image.size > 5.0.megabytes
   end
   def self.photolog(params)
   	  photo = Photo.find_by_id(params[:id])
   	  comment = Comment.where(photo_id: params[:id]).where(status: 1)
   	data={
   		:image => photo,
   		:comment => comment,
   		:comment_count => comment.count
   	}
   end
end
