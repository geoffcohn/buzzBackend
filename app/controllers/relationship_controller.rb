class RelationshipController < ApplicationController
  before_action :set_relationship, only: [:update, :destroy]
  def create
    @relationship = Relationship.new(relationship_params)
    @relationship.save
  end

  def update
    @relationship.update(relationship_params)
  end

  def 
    @relationship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_params
      params.permit(:follower_id, :friend_id)
    end
end
