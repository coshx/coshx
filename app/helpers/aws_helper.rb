module AwsHelper
	def connection
    	return @connection ||= Fog::Storage.new({
    	  :provider                 => 'AWS',
    	  :aws_access_key_id        => ENV['S3_KEY'],
    	  :aws_secret_access_key    => ENV['S3_SECRET']
    	})
	end

	def get_s3_url(data, mimeType, name, directory)
	  obj = directory.files.create(
      :key => name, 
      :body => data,
      :content_type => mimeType,
      :public => true
      )
	  image_url = obj.public_url.to_s
	  return image_url
  end

  def get_s3_directory(directory_name)
	 directory = connection.directories.get(directory_name)
  end

  def generate_name(extension)
   	random_name = ('a'..'z').to_a.shuffle[0..9].join
	  full_name = random_name + ".#{extension}"
	  return full_name
  end
end