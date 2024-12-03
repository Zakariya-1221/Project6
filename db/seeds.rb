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
# Create roles
admin_role = Role.create!(roleName: 'admin')
student_role = Role.create!(roleName: 'student')

# Create an admin user
User.create!(
  name: 'Admin',
  email: 'admin.1@osu.edu',
  password: 'admin123',
  role: admin_role
)

# Create a student user
User.create!(
  name: 'Student',
  email: 'student.1@osu.edu',
  password: 'student123',
  role: student_role
)