module PostsHelper

  def blog_post_path(post)
    if post.published?
      show_post_path post.permalink_attributes
    else
      post_path post
    end
  end

  def get_s3_url(data,mimeType,extension)
	blog_images_bucket = get_s3()
	object_name = generate_name(extension)
	obj = blog_images_bucket.objects.create(object_name,data,{content_type:mimeType,acl:"public_read"})
	image_url = obj.public_url().to_s
	return image_url
   end

   def get_s3
   	s3 = AWS::S3.new(:access_key_id => ENV['S3_KEY'],:secret_access_key => ENV['S3_SECRET'])
	bucket = s3.buckets['coshx-blog-images']
	return bucket
   end

   def generate_name(extension)
   	random_name = ('a'..'z').to_a.shuffle[0..9].join
	full_name = random_name + ".#{extension}"
	return full_name
   end
end
