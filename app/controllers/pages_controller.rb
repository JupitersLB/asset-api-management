class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @key = ENV["BITFINEX_API_KEY"]
    @secret = ENV["BITFINEX_API_SECRET"]
  end
end
