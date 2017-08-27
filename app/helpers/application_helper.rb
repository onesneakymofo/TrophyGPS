module ApplicationHelper
  def follower_link(post)
    if current_user.following_ids.include?(post.user.id)
      link_to 'Unfollow', users_relationship_path(post.user.follower_id_for(current_user), post_id: post.id), method: :delete, class: 'btn btn-primary btn-small'
    else
      link_to 'Follow', users_relationships_path(user_id: current_user, followed_id: post.user.id, post_id: post.id), method: :post, class: 'btn btn-primary btn-small'
    end
  end
end
