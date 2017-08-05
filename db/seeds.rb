tags = ['Sports', 'Technology', 'Movies', 'Artificial Intelligence']
Tag.all.destroy_all
tags.each { |x| Tag.create(name: x) }

emails = ['champ@forum.com', 'guide@forum.com']

emails.each { |x| User.create(email: x, password: 'forum123') }

question_data = { title: 'First day of the week', description: 'Which is the first day of the week, Monday or Sunday?', user: User.first }
question = Question.create(question_data)

question.question_tags.create(tag: Tag.first)

User.first.user_tags.create(tag: Tag.first)
User.last.user_tags.create(tag: Tag.first)

puts "Users created: #{emails}"
puts "Password to login: forum123"
