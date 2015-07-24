boards = Board.create([{ name: "Music", category: "Creative" }, { name: "Video Games", category: "Interests" }, { name:
"Papercraft", category: "Creative" }, { name: "Travel", category: "Other"}, { name: "Fitness", category: "Other" }, { name: "Technology", category: "Interests" }])

topic_names = ["Yay! Cats!", "Uh-oh, more cats?", "No way, even more cats!", "How many cat threads are there?"]
topic_descriptions = ["Wow, check out this cat thread over here", "I sure am loving making all these cat threads!", "Good thing there is seeds.rb to the rescue!"]

post_titles = ["Yep, yet another post title over here", "I sure like posting cats in your thread", "Got cats?", "Here you go!"]
post_descriptions = ["I love talking about cats on every board! Hire me, please?", "Look at all these glorious cat pictures, is it time to hire me yet?", "Boy, look at all the cats around here, bet you feel like hiring me now, huh?"]

boards.each do |board|
  10.times do
    Topic.create!([{ thread_name: "#{topic_names.sample(1).join} # #{rand(1..100)}", description: "#{topic_descriptions.sample(1).join}", board_id: board.id, topic_image:
                     fixture_file_upload("#{Rails.root}/spec/support/#{rand(1..30)}.jpg",
                                         "image/jpg") }])
  end
end

Topic.all.each do |topic|
  50.times do
    Post.create!([{ post_title: "#{post_titles.sample(1).join}", post_description: "#{post_descriptions.sample(1).join}", topic_id: topic.id, board_id: topic.board_id, post_image: fixture_file_upload("#{Rails.root}/spec/support/#{rand(1..30)}.jpg", "image/jpg") }])
  end
end
