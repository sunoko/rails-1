class DashController < ApplicationController
  def chart
    @data = Market.all.map do |market|
      [ market.exchange.name,
        market.tickers.where("created_at > ?", 10.hours.ago).map{|t| [t.created_at.to_i*1000, t.highest_bid_usd.to_f]},
        market.tickers.where("created_at > ?", 10.hours.ago).map{|t| [t.created_at.to_i*1000, t.lowest_ask_usd.to_f]}]
    end

    @strategy = Strategy.last
  end
end
