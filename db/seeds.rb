# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Clear existing data
User.destroy_all
Role.destroy_all

# Create roles
teacher_role = Role.create!(name: 'Teacher')
student_role = Role.create!(name: 'Student')

# Create teacher users
User.create!(name: 'Baha Amayreh', email: 'amayreh.1@osu.edu', role: teacher_role)

# Create student users
User.create!(name: 'Zakariya Ahmed', email: 'ahmed.990@osu.edu', role: student_role)
User.create!(name: 'James Smith', email: 'smith.3@osu.edu', role: student_role)
