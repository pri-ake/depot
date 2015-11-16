class StoreController < ApplicationController

  def index
    @products = Product.order(:title)

    #デバッグ用
    # puts "----------------------"
    # puts session[:counter]
    # puts session[:counter].nil?
    # puts "----------------------"

    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end

    @counter = session[:counter]

  end

end
