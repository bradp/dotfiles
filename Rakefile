# 	 ███████             ██               ████ ██  ██
# 	░██░░░░██           ░██              ░██░ ░░  ░██
# 	░██   ░██   ██████  ░██  ██  █████  ██████ ██ ░██  █████
# 	░███████   ░░░░░░██ ░██ ██  ██░░░██░░░██░ ░██ ░██ ██░░░██
# 	░██░░░██    ███████ ░████  ░███████  ░██  ░██ ░██░███████
# 	░██  ░░██  ██░░░░██ ░██░██ ░██░░░░   ░██  ░██ ░██░██░░░░
# 	░██   ░░██░░████████░██░░██░░██████  ░██  ░██ ███░░██████
# 	░░     ░░  ░░░░░░░░ ░░  ░░  ░░░░░░   ░░   ░░ ░░░  ░░░░░░

require 'rake'
require 'fileutils'

# These are all the files we want to symlink to ~
FILES = '.gemrc .gitconfig .gvimrc .hushlogin .vim .vimrc .zshrc .zlogin'

task :default => 'install'

desc "Hook our dotfiles into system-standard positions."
task :install do
	FILES.split.each do |file|
		symlink_file( file )
	end
end

# Run as rake setup_file[file_name]
# Zsh will be kind of weird with the brackets, so do this:
# 	rake 'setup_file[.my_dot_file]'
# unless you add 'unsetopt nomatch' to .zshrc, then you're good to go without the quotes
# symlink multiple files at once
# rake setup_file['.maid .vimrc .hushlogin']
desc "Symlink arbitrary files."
task :setup_file, [:file ] do |t, file|
	"#{file[:file]}".split.each do |single_file|
	  symlink_file( single_file )
	end
end

def symlink_file( file )
	source = "#{ENV["PWD"]}/#{file}"
	target = "#{ENV["HOME"]}/#{file}"

	puts "Source: #{source}"
	puts "Target: #{target}"

	if File.exists?(target) || File.symlink?(target)
		puts "[Overwriting] #{target}..."
	end

	`ln -nfs "#{source}" "#{target}" `

end
