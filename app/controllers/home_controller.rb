class HomeController < ApplicationController
  def index
    @all_profiles = CareReceiverProfile.all
  end

  private


end
