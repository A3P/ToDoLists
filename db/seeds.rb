# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all

Profile.create! [
	{gender: 'female', birth_year: 1954, first_name: 'Carly', last_name: 'Fiorina'},
	{gender: 'male', birth_year: 1946, first_name: 'Donald', last_name: 'Trump'},
	{gender: 'male', birth_year: 1951, first_name: 'Ben', last_name: 'Carson'},
	{gender: 'female', birth_year: 1947, first_name: 'Hillary', last_name: 'Clinton'},
]

Profile.all.each do |profile| 
	user = User.create(username: profile.last_name, password_digest: "#{profile.first_name}#{profile.birth_year}")
	profile.update(user_id: user.id)
end

users = User.all
due_date = Date.today + 1.year

users.each do |user|
	list = user.todo_lists.create(list_name: "Just do it", list_due_date: due_date)

	list.todo_items.create(
		due_date: due_date, title: 'Clean Room',
		description: 'or else mom will kill me', completed: false
	)
	list.todo_items.create(
		due_date: due_date, title: 'Finish Homework',
		description: 'or else teacher will kill me', completed: false
	)
	list.todo_items.create(
		due_date: due_date, title: 'Take Shower',
		description: 'or else girlfriend will kill me', completed: false
	)
	list.todo_items.create(
		due_date: due_date, title: 'Feed Cat',
		description: 'or else I will kill cat', completed: false
	)
	list.todo_items.create(
		due_date: due_date, title: 'Replace IceCream',
		description: 'or else sister will kill me', completed: false
	)
end