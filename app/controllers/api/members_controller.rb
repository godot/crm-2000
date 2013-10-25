class Api::MembersController < InheritedResources::Base
  private
  def permitted_params
    params.permit(member: [:name, :phone, :email])
  end
end
