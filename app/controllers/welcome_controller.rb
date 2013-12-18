class WelcomeController < ApplicationController
  def index
  end
  def search
    Search.full_search(@search)
  end
end
