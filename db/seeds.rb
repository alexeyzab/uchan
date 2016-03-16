Post.destroy_all
Topic.destroy_all
Board.destroy_all
Catalog.destroy_all

Board.create([{ name: "Music", slug: "music", category: "Creative" }, { name: "Video Games", slug: "video-games", category: "Interests" }, { name:
"Papercraft", slug: "papercraft", category: "Creative" }, { name: "Travel", slug: "travel", category: "Other"}, { name: "Fitness", slug: "fitness", category: "Other" }, { name: "Technology", slug: "technology", category: "Interests" }])

sample_name = ["Hi there!", "Oh, hi!", "Wow, what a great topic name", "This is
               really great", "Crazy titles all around", "Not sure what else to
               say"]
sample_description = ["This is a great post", "This one is even better", "Not
                      sure how many posts I can come up with on my own", "This
                      is fun, sort of", "Gotta keep making posts", "And another
                      one", "Good thing I have plenty of TEST images, huh"]

Board.all.each do |board|
  c = Catalog.new(board_id: board.id)
  c.save
  t = Topic.new({ topic_name: sample_name.sample, description: sample_description.sample, board_id: board.id })
  t.topic_image = File.open("#{Dir.getwd}/spec/support/test.jpg")
  t.save
end

5.times do
  Topic.all.each do |topic|
    p = Post.new({ post_title: sample_name.sample, post_description: sample_description.sample, board_id: topic.board_id, topic_id: topic.id })
    p.post_image = File.open("#{Dir.getwd}/spec/support/test.jpg")
    p.save
  end
end
