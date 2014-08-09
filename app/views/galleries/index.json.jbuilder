json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :title, :account_id
  json.url gallery_url(gallery, format: :json)
end
