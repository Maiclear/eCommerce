class Admin::PagesController < ApplicationController
  before_action :require_admin
  def index
  end
end
