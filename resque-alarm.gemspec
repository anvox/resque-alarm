Gem::Specification.new do |s|
  s.name              = "resque-alarm"
  s.version           = "0.1.2"
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "A Resque plugin to alarm when queue is too long."
  s.homepage          = "https://github.com/heosuax/resque-alarm"
  s.email             = "heosuax@gmail.com"
  s.authors           = [ "AnVo" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("test/**/*")

  s.description       = "A Resque plugin to alarm when queue is too long."
end
