Maid.rules do

	rule 'Dropbox Screenshots' do
		dir('~/Desktop/Screen Shot *').each do |path|
			if 1.week.since?(accessed_at(path))
				trash(path)
			end
		end
	end

	#
	# Desktop SQL Files
	#
	rule 'Database Backups' do
		dir('~/Desktop/*.sql').each do |path|
			mkdir( '~/Documents/DB Backups/' + Time.now.strftime("%Y-%m-%d") )
			move(path, '~/Documents/DB Backups/' + Time.now.strftime("%Y-%m-%d") )
		end
	end

	#
	# Other Desktop Files
	#
	rule 'Other Desktop Files' do
		dir('~/Desktop/*.*').each do |path|
			mkdir( '~/Desktop/Desktop/' + Time.now.strftime("%Y-%m-%d") )
			move(path, '~/Desktop/Desktop/' + Time.now.strftime("%Y-%m-%d") )
		end
	end

	#
	# Update all our Applications, brew, oh my zsh and such
	#
	rule 'Updating Brew' do
		`brew update`
	end
	rule 'Updating Brews' do
		`brew upgrade`
	end
	rule 'Cleaning Brew' do
		`brew cleanup`
	end
	rule 'Cleaning Brew Cask' do
		`brew cask cleanup`
	end
	rule 'Updating Cask Appliactions' do
		`brew cask update`
	end
	rule 'Updating dotfiles submodules' do
		`cd ~/dotfiles && git submodule foreach git pull origin master`
	end
	rule 'Updating gems ' do
		`sudo gem update`
	end
	rule 'Update npm' do
		`sudo npm -g update`
	end

	#
	# Downloads Folder Stuff
	#
	#
	# Desktop SQL Files
	#
	rule 'Database Backups' do
		dir('~/Downloads/*.sql').each do |path|
			mkdir( '~/Documents/DB Backups/' + Time.now.strftime("%Y-%m-%d") )
			move(path, '~/Documents/DB Backups/' + Time.now.strftime("%Y-%m-%d") )
		end
	end


	rule 'Trash incomplete downloads' do
		trash dir('~/Downloads/*.download').select { |p| 3.days.since modified_at p }
	end

	rule 'Trash zips and tarballs downloaded from GitHub' do
		dir('~/Downloads/*.{zip,tgz,gz,rar,tar}').each do |path|
			if downloaded_from(path).any? { |u| u.match %r{//([^\/]+\.)?github\.com\/} }
				trash path
			end
		end
	end

	rule 'Trash downloads over a month old' do
		dir('~/Downloads/*').each do |path|
			if 4.weeks.since?(accessed_at(path))
				trash(path)
			end
		end
	end

	rule 'Remove empty directories' do
		dir(['~/Downloads/*']).each do |path|
			if File.directory?(path) && dir("#{ path }/*").empty?
				trash(path)
			end
		end
	end

end
