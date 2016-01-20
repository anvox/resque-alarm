Gem::Specification.new do |s|
  s.name              = "resque-alarm"
  s.version           = "0.1.6"
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "A Resque plugin to alarm when queue is too long."
  s.homepage          = "https://github.com/anvox/resque-alarm"
  s.email             = "thien.an.vo.nguyen@gmail.com"
  s.authors           = [ "AnVo" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("test/**/*")

  s.description       = "A Resque plugin to alarm when queue is too long. Using email or rails log, or others log system. \
  Use other tools to analyze result. Queue is checked every time job enqueued."
end
