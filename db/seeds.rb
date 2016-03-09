include RandomData

#Creates users

5.times do
  User.create!(

  name: RandomData.random_name,
  email: RandomData.random_email,
  password: "remington"
  )

end

#Create Personal User
admin = User.create!(
  name: "Wil Burke",
  email: "billyburke13@gmail.com",
  password: "mustang",
  role: 'admin'
)

#Create an Admin
admin = User.create!(
  name: "Admin Example",
  email: "admin@example.com",
  password: "helloworld",
  role: 'admin'
)

#Create a Moderator
mod = User.create!(
  name: "Moderator Example",
  email: "moderator@example.com",
  password: "helloworld",
  role: 'moderator'
)

# Create a member
member = User.create!(
  name:     'Member Example',
  email:    'member@example.com',
  password: 'helloworld'
)
users = User.all

# Create Labels
%w(Sam Frodo Boromir Sauron Galandriel Bilbo Saruman Gollum Gandalf Aragorn Gimli).each do |label|
  Label.create!(name: label)
end
labels = Label.all

# Creates Topics

15.times do
  t = Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
  if 0.5 > rand()
    t.labels = rand(1..5).times.collect { labels.sample }.uniq
    t.save!
  end 
end
topics = Topic.all



# Create Posts
50.times do
  p = Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
  if 0.5 > rand()
    p.labels = rand(1..5).times.collect { labels.sample }.uniq
    p.save!
  end 
end
posts = Post.all


# Create Comments
100.times do
  Comment.create!(
    user: users.sample, 
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

50.times do
  Comment.create!(
    user: users.sample, 
    topic: topics.sample,
    body: RandomData.random_paragraph
  )
end



puts "Seed finished"
puts "#{User.count} users were created"
puts "#{Topic.count} topics were created"
puts "#{Post.count} posts were created"
puts "#{Comment.count} comments were created"
puts "#{Label.count} labels were created"
