require 'base64'
class UploadsController < ApplicationController
	def supload
		s3 = AWS::S3.new(:access_key_id => ENV['S3_KEY'],:secret_access_key => ENV['S3_SECRET'])
		bucket = s3.buckets['coshx-blog-images']
		data = Base64.decode64(params[:file].to_s)
		type = params[:mimeType].to_s
		extension = params[:extension].to_s
		name = ('a'..'z').to_a.shuffle[0..7].join + ".#{extension}"
		obj = bucket.objects.create(name,data,{content_type:type,acl:"public_read"})
		url = obj.public_url().to_s
		binding.pry
		render text: url
	end

end
