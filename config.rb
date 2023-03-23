require 'cloudinary'

CLOUD_NAME = "dbkleuyx2"
API_KEY = "819496669588144"
API_SECRET = "ge09qzuxcnB_ait8CoqLTdrCF2E"

Cloudinary.config_from_url("cloudinary://#{API_KEY}:#{API_SECRET}@#{CLOUD_NAME}")
Cloudinary.config do |config|
  config.secure = true
end