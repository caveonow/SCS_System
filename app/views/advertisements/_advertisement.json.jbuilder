json.extract! advertisement, :id, :AdvertisementName, :AdvertisementDescription, :created_at, :updated_at
json.url advertisement_url(advertisement, format: :json)