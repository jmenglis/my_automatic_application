class ApplicationController < Sinatra::Base

  Dotenv.load
  # Set Views and Public Dir to proper directory
  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)

  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV["CONSUMER_KEY"]
    config.consumer_secret = ENV["CONSUMER_SECRET"]
    config.access_token = ENV["ACCESS_TOKEN"]
    config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  end



  get '/dm' do
    client.create_direct_message('joshenglish','Thank you for following @redothecube.  Please follow my journey through code bootcamp and launching my business at redothecube.com/code.  You can sign up to receive the email updates.  I promise not to spam you.')
  end

  get '/test' do
    User.create userid: 100, sent_date: nil
    "Added to DB"
  end


  get '/users' do
    result = client.follower_ids("redothecube")
    result.attrs[:ids].each do |item|
      User.create userid: item, sent_date: nil
    end
    "Completed the Addition"
  end
end


