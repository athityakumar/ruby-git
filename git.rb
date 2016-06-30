if `git status`.include? "fatal: Not a git repository"
  `git init`
else
  puts "Git init - checked."  
end  


#system "git add --all"

#system "git commit -m 'Ruby-bot git commit'"
#system "git push origin master"

out = `git remote -v`
if out.empty?
  puts "Empty"
else
  puts out
end