class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age

  attributes :image do |img|
    if img.image.present?
      host = Rails.env.development? ? "http://localhost:3000" : ENV["BASE_URL"]
      host + Rails.application.routes.url_helpers.rails_blob_url(img.image,only_path: true)
    end
  end
end
