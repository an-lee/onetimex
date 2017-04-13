namespace :dev do

  task :fake => :environment do

    admin = User.create!(:email => "admin@test.com", :password => "111111", :is_admin => true )
    users = []
    10.times do
      users << User.create!( :email => Faker::Internet.email, :password => "111111")
    end

  end

end
