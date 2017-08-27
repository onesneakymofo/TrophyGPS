module Users
  class RelationshipsController < ApplicationController
    def create
      if Relationship.create(user_id: relationship_params['user_id'], followed_id: relationship_params['followed_id'])
        redirect_to post_path(relationship_params['post_id'])
      else
      end
    end

    def destroy
      @relationship = Relationship.find(params['id'])
      @relationship.destroy
      redirect_to post_path(relationship_params['post_id'])
    end

    private

    def relationship_params
      params.permit(:followed_id, :user_id, :id, :post_id)
    end
  end
end
