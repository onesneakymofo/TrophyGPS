module ApplicationHelper
  def follower_link(user)
    if current_user.following_ids.include?(user.id)
      link_to 'Unfollow', users_relationship_path(user.follower_id_for(current_user)), method: :delete
    else
      link_to 'Follow', users_relationships_path(current_user, followed_id: user.id), method: :post
    end
  end
end
