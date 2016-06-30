if `git status`.include? "fatal: Not a git repository"
  `git init`
  puts "Git init - done."
else
  puts "Git init - checked."  
end  

if `git remote -v`.empty?
  puts "Paste remote git URL : "
  remote = gets.chomp
  `git remote add origin #{remote}`
  puts "Git remote - done."
else
  puts "Git remote - checked."
end

if `git status`.include? "Changes not staged for commit:"
  `git add --all`
  puts "Git add - done."
else
  puts "Git add - checked."  
end  

if `git status`.include? "Changes to be committed:"
  puts "Enter commit message : "
  message = gets.chomp
  if message.empty?
    message = `git status`.split('(use "git reset HEAD <file>..." to unstage)')[1].strip.gsub("\n",".")
  end  
  `git commit -m "Ruby-bot commit - #{message}"`
  puts "Git commit - done."  
else
  puts "Git commit - checked."  
end  

if `git status`.include? "nothing to commit, working directory clean"
  `git push origin master`
  puts "Git push - done."  
else
  puts "Git push - checked."  
end  
