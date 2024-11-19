class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erbが表示される
    end
  end
end
