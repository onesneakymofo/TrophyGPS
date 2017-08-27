json.array! current_user.posts do |post|
  json.id post.id
  json.coordinates post.coordinates
end
