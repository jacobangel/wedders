# Wedders Rakefile
require 'fileutils'



namespace :page do
	@root = File.dirname(File.expand_path(__FILE__))
	@pages_view_path = File.join(@root, 'views/pages')


	desc "Add view files and route for a new page."
	task :add do 
		name = ENV["name"] 

		if name.nil? 
			puts "usage: rake page:add -- name=EXAMPLE"
			exit -1
		end
		
		qualified_file = "views/pages/#{name}.erb"
		if File.exists? qualified_file
			puts "Sorry, the page template `#{name}.erb` already exists."
			exit -1
		end

		puts "Adding Page #{name}.erb to /views/pages"
		File.open(qualified_file, 'w') do |file|
			file.puts <<-EOF
<h1>#{name}</h1>
<p class='lead'>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
<p>Ennius quae an avocent latinas suscepi in quo non nostrum, quidem brute eos synephebos laborum contemnentes, philosophia nam difficilem et accusata tam difficilius sunt tamque male legam quae potest iustioribus? Moderatius legendam dicat inertissimae scribendi non, mihi ad quam divina male turpis fodere eruditi caecilii aristotelem graecos quis est incurreret se dolor enim? Ne offendit ratione lectorem si quidam utinam vero quamquam sint ut aut verum, divina modus graecos rutilius an etsi nominavi est ornateque collaudata ad. </p>
<p>In a non terentianus hoc industria omnino expressas accusata coerceri cum litteris scribere nam, non maxime ut ea. Nobis cognitionem reformidans terentii albucius utramque dissentio multos putem id laboris si veniam, iudicium sin litteras placeat, scipio non latinas scripta, defensa nostrum graecis quidem mediocriterne de vero. Quodsi, labore ab postulant postremo sunt adhuc cum indoctis coerceri quos, abhorreant scribere non esse illum mediocris, fabulas quid latinis philosophia ab graecum res esset ornateque amet iudicium. </p>
EOF
		end

		File.open('app.rb', 'a') do |f|
			f.puts <<-EOF

get '/#{name}' do
	@title = "Default Title | \#{BASE_TITLE}"
	@body_class = "page-#{name}"
	erb :#{name}
end
EOF
		end
		puts "Route added at path /#{name}"
		FileUtils.touch 'tmp/restart.txt' 
	end
end