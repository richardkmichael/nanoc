desc "Compile the site."
task :compile do
  Nanoc::CLI.run %w( compile )
end
