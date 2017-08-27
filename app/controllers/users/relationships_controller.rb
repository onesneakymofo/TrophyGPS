module Users
  class RelationshipsController < ApplicationController
    def create
      if Relationship.create(user_id: relationship_params['user_id'], followed_id: relationship_params['followed_id'])
        redirect_to posts_path
      else
      end
    end

    def destroy
      @relationship = Relationship.find(params['id'])
      @relationship.destroy
      redirect_to posts_path
    end

    private

    def relationship_params
      params.permit(:followed_id, :user_id, :id)
    end
  end
end
