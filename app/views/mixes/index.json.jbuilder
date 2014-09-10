json.array!(@mixes) do |mix|
  json.extract! mix, :id, :mix_no, :title, :description, :avatar, :artist_id, :soundcloud
  json.url mix_url(mix, format: :json)
end
