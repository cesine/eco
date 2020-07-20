Gem::Specification.new do |s|
  s.name        = "eco-source"
  s.version     = "1.1.0-rc-3"
  s.date        = Time.now.strftime("%Y-%m-%d")

  s.homepage    = "https://github.com/sstephenson/eco/"
  s.summary     = "Eco compiler source"
  s.description = "JavaScript source code for the Eco (Embedded CoffeeScript template language) compiler"
  s.files = [
    "lib/eco/eco.js",
    "lib/eco/source.rb"
  ]

  s.authors     = ["Sam Stephenson"]
  s.email       = "sstephenson@gmail.com"
end