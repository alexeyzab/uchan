Post.destroy_all
Topic.destroy_all
Board.destroy_all

boards = Board.create([{ name: "Music", category: "Creative" }, { name: "Video Games", category: "Interests" }, { name:
"Papercraft", category: "Creative" }, { name: "Travel", category: "Other"}, { name: "Fitness", category: "Other" }, { name: "Technology", category: "Interests" }])
