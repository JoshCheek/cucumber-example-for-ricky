require 'active_record'
require 'logger'
ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

ActiveRecord::Schema.define do
  self.verbose = false
  create_table :merchants do |t|
  end
  create_table :items do |t|
    t.string  :name
    t.integer :stock
    t.integer :merchant_id
  end
end

class Merchant < ActiveRecord::Base
  has_many :items
end

class Item < ActiveRecord::Base
  belongs_to :merchant
end

require 'sinatra'
class RailsEngine < Sinatra::Base
  get '/api/v1/merchants/:id/items' do
    content_type :json
    Merchant.find(params[:id]).items.to_json
  end
end
