require 'rake/clean'

CLEAN.include('*.o')
CLEAN.include('*.hi')
CLEAN.include('*.pyc')
CLEAN.include('*.class')
CLEAN.include('*.dec')
CLEAN.include('*.enc')
CLEAN.include('farewell')

DIFF_COMMAND = "diff -u README.md README.md.dec 2>&1"
REDIRECT = "README.md.enc > README.md.dec"

def complain?(which)
  puts "#{which} version sucks" unless `#{DIFF_COMMAND}`.empty?  
end

desc "One Shot"
task :default do
  [:farewell_ruby,
   :farewell_python,
   :farewell_java,
   :farewell_scala,
   :farewell_c,
   :farewell_haskell,
   :farewell_perl].each do |task|
    Rake::Task[task].invoke
  end
end

task :encrypt => :clean do
  `ruby encrypt.rb README.md > README.md.enc`
end

desc "Ruby Version"
task :farewell_ruby => :encrypt do
  `ruby farewell.rb #{REDIRECT}`
  complain? "ruby"
end

desc "Python Version"
task :farewell_python => :encrypt do
  `python farewell.py #{REDIRECT}`
  complain? "python"
end

desc "Java Version"
task :farewell_java => :encrypt do
  `javac Farewell.java`
  `java Farewell #{REDIRECT}`
  complain? "java"
end

desc "Scala Version"
task :farewell_scala => :encrypt do
  `scala farewell.scala #{REDIRECT}`
  complain? "scala"
end

desc "C Version"
task :farewell_c => :encrypt do
  `gcc -o farewell farewell.c`
  `./farewell #{REDIRECT}`
  complain? "c"
end

desc "Haskell Version"
task :farewell_haskell => :encrypt do
  `ghc --make farewell.hs`
  `./farewell #{REDIRECT}`
  complain? "haskell"
end

desc "Perl Version"
task :farewell_perl => :encrypt do
  `perl farewell.pl #{REDIRECT}`
  complain? "perl"
end
