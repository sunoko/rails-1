class Exchange < ActiveRecord::Base
  has_many :markets, :dependent => :destroy
  has_many :balances, :as => :balanceable, :dependent => :destroy
  attr_accessible :fee_percentage, :name

  def api
    @api ||= "Exchanges::#{name.classify}".constantize.new
  end

  def usd
    balances.usd.last
  end

  def btc
    balances.btc.last
  end
end
