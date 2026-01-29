require 'faker'

puts "🧹 Cleaning database..."
Comment.destroy_all
Issue.destroy_all
Project.destroy_all

puts "📁 Creating projects..."

5.times do
  project = Project.create!(
    name: Faker::App.name,
    description: Faker::Lorem.paragraph(sentence_count: 3)
  )

  puts "  → Created project: #{project.name}"

  rand(8..15).times do
    issue = project.issues.create!(
      title: Faker::Hacker.say_something_smart,
      description: Faker::Lorem.paragraph(sentence_count: 4),
      status: Issue.statuses.keys.sample,
      priority: Issue.priorities.keys.sample,
      assigned_to: Faker::Name.name,
      due_date: Faker::Date.forward(days: 14)
    )

    rand(1..5).times do
      issue.comments.create!(
        content: Faker::Lorem.sentence(word_count: 10)
      )
    end
  end
end

puts "✅ Seeds created:"
puts "Projects: #{Project.count}"
puts "Issues: #{Issue.count}"
puts "Comments: #{Comment.count}"