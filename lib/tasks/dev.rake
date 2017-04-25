namespace :dev do

  task :fake => :environment do

    admin = User.create(:email => "admin@test.com", :password => "111111", :is_admin => true )

    users = []
    10.times do
      users << User.create( :email => Faker::Internet.email, :name => Faker::Name.name, :password => "111111")
    end

    products = []
    20.times do
      products << Product.create( :title => Faker::Commerce.product_name, :description => Faker::Lorem.paragraph, :price => Faker::Commerce.price, :quantity => Faker::Number.between(1, 100))
    end

    posts = []
    500.times do
      posts << Post.create( :title => Faker::Commerce.product_name, :content => Faker::Lorem.paragraphs, :product_id => products.sample.id, :user_id => users.sample.id)
    end

    comments1 = []
    500.times do
      comments1 << Comment.create( :content => Faker::Lorem.paragraphs, :commentable_type => "Post", :commentable_id => posts.sample.id, :user_id => users.sample.id )
    end

    comments2 = []
    500.times do
      comments2 << Comment.create( :content => Faker::Lorem.paragraphs, :commentable_type => "Product", :commentable_id => products.sample.id, :user_id => users.sample.id )
    end


  end

end
