class Image < ApplicationRecord
  belongs_to :user
 # has_many :comments
  def self.mypost(params)
    if params[:id].present?
     	post = Image.where(id: params[:id])
	else
 		post = Image.all 
 	end
     cmd = Comment.where(image_id: params[:image_id])
     data={
     	:image => post,
     	:comment => cmd,
     	:count => cmd.count
     }
 end
end
