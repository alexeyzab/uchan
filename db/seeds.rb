Post.destroy_all
Topic.destroy_all
Board.destroy_all

Board.create([{ name: "Music", category: "Creative" }, { name: "Video Games", category: "Interests" }, { name:
"Papercraft", category: "Creative" }, { name: "Travel", category: "Other"}, { name: "Fitness", category: "Other" }, { name: "Technology", category: "Interests" }])

sample_name = ["Hi there!", "Oh, hi!", "Wow, what a great topic name", "This is
               really great", "Crazy titles all around", "Not sure what else to
               say"]
sample_description = ["This is a great post", "This one is even better", "Not
                      sure how many posts I can come up with on my own", "This
                      is fun, sort of", "Gotta keep making posts", "And another
                      one", "Good thing I have plenty of cat images, huh"]

Board.all.each do |board|
  t = Topic.new({ topic_name: sample_name.sample, description: sample_description.sample, board_id: board.id })
  t.topic_image = File.open("#{Rails.root}/spec/support/#{rand(1..30)}.jpg")
  t.save
end

5.times do
  Topic.all.each do |topic|
    p = Post.new({ post_title: sample_name.sample, post_description: sample_description.sample, board_id: topic.board_id, topic_id: topic.id })
    p.post_image = File.open("#{Rails.root}/spec/support/#{rand(1..30)}.jpg")
    p.save
  end
end
