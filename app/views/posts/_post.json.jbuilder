json.extract! post, :id, :meta_title, :meta_description, :permalink, :title, :body, :no_index, :created_at, :updated_at
json.url post_url(post, format: :json)
