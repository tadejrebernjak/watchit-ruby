json.extract! video, :id, :title, :description, :thumbnail, :file, :views, :created_at, :updated_at
json.url video_url(video, format: :json)
