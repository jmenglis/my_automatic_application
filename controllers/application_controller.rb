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

  get '/showme' do
    @new_user = User.all
    @new_user
  end

  # sending DMs automatically to users
  get '/dm' do
    @users_all = User.where(:sent_message=>'false').map{|x| x.userid}
    i = 0;
    while i < @users_all.length do
      @new_user = User[:sent_message=> false]
      p "----------------------"
      client.create_direct_message(@new_user.userid,'Hello! Thanks for following @redothecube.  Please follow my journey as I complete a coding bootcamp in preparation of launching my own business.  You can sign up to receive the vlog updates and I promise not to spam you!  Goto redothecube.com/code')
      p "#{@new_user.userid} received a Direct Message"
      p "----------------------"
      p "Sleeping for 60 seconds"
      sleep(60)
      p "The system is continuing the process"
      @new_user.sent_message = 1
      @new_user.save
      i += 1
    end
    "Job is complete"
  end

  # Get Userslist for the game
  get '/users' do
    @result = client.follower_ids("redothecube")
    @stage_array = @result.attrs[:ids]
    @remove_array = User.map{|x| x.userid}
    @stage_array = @stage_array - @remove_array
    @stage_array.each do |item|
      User.create userid: item, sent_message: 0
    end
    "Completed the addition of #{@stage_array.length} users to the script"
  end
end


