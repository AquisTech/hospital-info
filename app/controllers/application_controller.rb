class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def render_failure(object)
    render 'shared/failure', locals: { object: object }
  end
end
