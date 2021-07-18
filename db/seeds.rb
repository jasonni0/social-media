# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin Account

admin = User.create!(
    email: "alice@email.com",
    password: "password",
    first_name: "alice",
    last_name: "smith",
    is_admin: true
)

# User Accounts

user2 = User.create!(
    email: "bob@email.com",
    password: "password",
    first_name: "bob",
    last_name: "smith",
    is_public: true
)

user3 = User.create!(
    email: "homer@email.com",
    password: "password",
    first_name: "homer",
    last_name: "smith",
    is_public: true
)

user4 = User.create!(
    email: "lisa@email.com",
    password: "password",
    first_name: "lisa",
    last_name: "smith",
    is_public: true
)

user5 = User.create!(
    email: "alex@email.com",
    password: "password",
    first_name: "alex",
    last_name: "smith"
)

user6 = User.create!(
    email: "bryant@email.com",
    password: "password",
    first_name: "bryant",
    last_name: "smith",
    is_public: true
)

user7 = User.create!(
    email: "john@email.com",
    password: "password",
    first_name: "john",
    last_name: "smith",
    is_public: true
)

# Friendship

friend1 = Friend.create!(
    status: "accepted",
    requester: user2,
    requestee: user3
)

friend2 = Friend.create!(
    status: "accepted",
    requester: user4,
    requestee: user2
)

friend3 = Friend.create!(
    status: "pending",
    requester: user5,
    requestee: user2
)

friend4 = Friend.create!(
    status: "pending",
    requester: user6,
    requestee: user2
)

friend5 = Friend.create!(
    status: "accepted",
    requester: user5,
    requestee: user3
)

# Post

post1 = Post.create!(
    title: "My First Post",
    description: "This is my first time experience with Social-Media, I like it! I hope my friends will use Social-Media soon!",
    creator: user2
)

post2 = Post.create!(
    title: "I love travel",
    description: "Here's the reason I love travel. Travel to leave our world a better place. Travel to learn. Travel to meet different cultures. Travel to escape reality. Travel to relax. Travel to explore",
    creator: user2
)

post3 = Post.create!(
    title: "I love sushi",
    description: "Sushi is not only the best food in the entire world, but it is also the most beautiful. Its perfect circular shape, vibrant colors, and precise set-up just makes your mouth water.",
    creator: user2
)

post4 = Post.create!(
    title: "My First Post",
    description: "This is my first post in Social-Media. welcome to add me as friend.",
    creator: user3
)

post5 = Post.create!(
    title: "My First Post",
    description: "This is my first post in Social-Media. My name is Lisa Smith, I'm looking for some friends.",
    creator: user4
)

post6 = Post.create!(
    title: "My First Post",
    description: "This is my first post in Social-Media. I like to chat with others.",
    creator: user5
)

post7 = Post.create!(
    title: "My First Post",
    description: "This is my first post in Social-Media. I would like to know some people in here.",
    creator: user6
)

post8 = Post.create!(
    title: "My First Post",
    description: "This is my first post in Social-Media.",
    creator: user7
)

# Comment

comment1 = Comment.create!(
    comment_post: "Welcome join Social-Media!",
    post: post1,
    commenter: user3
)

comment2 = Comment.create!(
    comment_post: "Welcome join Social-Media!",
    post: post1,
    commenter: user4
)

comment3 = Comment.create!(
    comment_post: "I love travel too!",
    post: post2,
    commenter: user3
)

comment4 = Comment.create!(
    comment_post: "Welcome join Social-Media Homer Smith",
    post: post4,
    commenter: user4
)

# Report

report1 = Report.create!(
    reason: "This is a very offensive comment!",
    reportable: comment1
)

report2 = Report.create!(
    reason: "This is a very offensive post!",
    reportable: post1
)

report3 = Report.create!(
    reason: "This is a very offensive comment!",
    reportable: comment3
)

# Message

message1 = Message.create!(
    content: "Hello I'm bob.",
    sender: user2,
    receiver: user3
)

message2 = Message.create!(
    content: "Hi, I'm homer",
    sender: user3,
    receiver: user2
)

# Guideline

guideline1 = Guideline.create!(
    guideline: "Remember the human. Social-Media is a place for creating community and belonging, not for attacking marginalized or vulnerable groups of people. Everyone has a right to use Social-Media free of harassment, bullying, and threats of violence. Communities and users that incite violence or that promote hate based on identity or vulnerability will be banned."
)

guideline2 = Guideline.create!(
    guideline: "Abide by community rules. Post authentic content into communities where you have a personal interest, and do not cheat or engage in content manipulation (including spamming, vote manipulation, ban evasion, or subscriber fraud) or otherwise interfere with or disrupt Social-Media communities."
)

guideline3 = Guideline.create!(
    guideline: "Respect the privacy of others. Instigating harassment, for example by revealing someone’s personal or confidential information, is not allowed. Never post or threaten to post intimate or sexually-explicit media of someone without their consent."
)

guideline4 = Guideline.create!(
    guideline: "Do not post or encourage the posting of sexual or suggestive content involving minors."
)

guideline5 = Guideline.create!(
    guideline: "Keep it legal, and avoid posting illegal content or soliciting or facilitating illegal or prohibited transactions."
)

guideline6 = Guideline.create!(
    guideline: "Don’t break the site or do anything that interferes with normal use of Social-Media."
)