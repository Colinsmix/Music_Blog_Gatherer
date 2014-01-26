# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "********Seeding Data Start************"

admin = User.create(
        first_name: 'Colin', last_name: 'Shields', username: 'Colinsmix',
        email: "csunc11@aol.com",
        password: 'colins85', password_confirmation: 'colins85',
        role: 'Admin')


if admin.errors.blank?
    puts "***User #{admin.first_name} #{admin.last_name} created ***"
    admin.add_role :admin # add_role is method defined by rolify gem
    puts "***admin role assigned to #{admin.first_name} #{admin.last_name}***"
else
    puts "admin user failed to create due to below reasons:"
    admin.errors.each do |x, y|
       puts"#{x} #{y}" # x will be the field name and y will be the error on it
     end
end

Blog.create(
  name: "Top House Music Blog", url: "www.tophousemusicblog.com/",
  description: "A House Music Blog", tag_list: ["electronic","house"],
  status: 'Verified' )
Blog.create(
  name: "Just Do Hits", url: "justdohits.com/",
  description: "A House Music Blog", tag_list: ["electronic","house","popular"],
  status: 'Verified' )
Blog.create(
  name: "Feel My Bicep", url: "www.feelmybicep.com/",
  description: "A House Music Blog", tag_list: ["electronic","house", "techno"],
  status: 'Verified' )
Blog.create(
  name: "The Fat Club", url: "www.thefatclub.com/",
  description: "A House Music Blog", tag_list: ["electronic","house"],
  status: 'Verified' )
Blog.create(
  name: "Pelski", url: "pelski.co.uk/",
  description: "A House Music Blog", tag_list: ["electronic","house","underground"],
  status: 'Verified' )
Blog.create(
  name: "Wearexyst", url: "wearexyst.co.uk",
  description: "A House Music Blog", tag_list: ["electronic","house"],
  status: 'Verified' )
Blog.create(
  name: "Clicky Clicky Music", url: "jbreitling.blogspot.com/",
  description: "A House Music Blog", tag_list: ["electronic","house"],
  status: 'Verified' )
Blog.create(
  name: "Discotizer's House Music Blog", url: "www.discotizer.com/",
  description: "A House Music Blog", tag_list: ["electronic","house"],
  status: 'Verified' )
Blog.create(
  name: "Do the Pants Dance", url: "www.dothepantsdance.com",
  description: "A House Music Blog", tag_list: ["electronic","house"],
  status: 'Verified' )
Blog.create(
  name: "Asian Man Dan", url: "www.asianmandan.com",
  description: "A House Music Blog", tag_list: ["electronic","house"],
  status: 'Verified' )
Blog.create(
  name: "Disco Belle", url: "www.discobelle.net/",
  description: "A House Music Blog", tag_list: ["electronic","house"],
  status: 'Verified' )
Blog.create(
  name: "Crack in the Road", url: "www.crackintheroad.com/",
  description: "A House Music Blog", tag_list: ["electronic","house"],
  status: 'Verified' )
Blog.create(
  name: "A Blog Supreme" , url: "http://www.npr.org/blogs/ablogsupreme/" ,
  description: "NPR's A Blog Supreme" , tag_list: ["jazz", "history", "news"],
  status: 'Verified' )
Blog.create(
  name: "Jazz Wax" , url: "http://www.jazzwax.com/" ,
  description: "Marc Myers writes daily on jazz legends and legendary jazz recordings", tag_list:["jazz"],
  status: 'Verified' )
Blog.create(
  name: "Jazz Rochester" , url: "http://www.jazzrochester.com/" ,
  description: "Jazz in the Rochester Area" , tag_list: ["jazz", "live"],
  status: 'Verified' )
Blog.create(
  name: "Free Jazz Blog" , url: "http://www.freejazzblog.org/" ,
  description: "The Free Jazz Collective" , tag_list: ["jazz"],
  status: 'Verified' )
Blog.create(
  name: "Squeeze My Lemon" , url: "squeezemylemon.blogspot.com/" ,
  description: "" , tag_list: ["jazz", "instructional", "variety"],
  status: 'Verified' )
Blog.create(
  name: "Jazz Lives" , url: "jazzlives.wordpress.com/",
  description: "A blog by Michael Steinmen" , tag_list: ["jazz"],
  status: 'Verified' )
Blog.create(
  name: "So Much Sound", url: "somuchsound.blogspot.com/",
  description: "A Professional Musician Living in New York" , tag_list: ["jazz","news","variety"],
  status: 'Verified' )
Blog.create(
  name: "Next Bop", url: "nextbop.com/blog/" ,
  description: "The Next Generation of Jazz" , tag_list: ["jazz"],
  status: 'Verified' )
Blog.create(
  name: "Jazz Shaped" , url: "www.jazzshaped.com/" ,
  description: "A UK based Jazz Blog" , tag_list: ["jazz", "uk"],
  status: 'Verified' )
Blog.create(
  name: "Jazz Wrap" , url: "jazzwrap.blogspot.com/" ,
  description: "Your source covering jazz and undiscovered music from around the globe." , tag_list: ["jazz"],
  status: 'Verified' )













