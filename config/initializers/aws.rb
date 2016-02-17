#Aws.config({access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
#           secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] })

Aws.config.update({region: 'eu-west-1'})
#S3_BUCKET = Aws::S3.new.buckets[ENV['S3_BUCKET']]

