json.array! @feeds do |feed|
  json.id feed.id
  json.title feed.title
  json.text feed.text
  json.created_at feed.formatted_created_at
end