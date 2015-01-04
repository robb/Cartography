Pod::Spec.new do |s|

  s.name         = "Cartography"
  s.version      = "0.1.0"
  s.summary      = "Declarative Auto Layout in Swift"

  s.description  = <<-DESC
                   Set up your Auto Layout constraints declaratively and without any stringly typing!
                   DESC

  s.homepage     = "https://github.com/robb/Cartography"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Robert Böhnke" => "robb@robb.is" }
  s.ios.deployment_target = "8.0"

  s.source = { :git => "https://github.com/robb/Cartography.git", :tag => "#{s.version}" }
  s.source_files  = "Cartography/*.swift"

  s.requires_arc = true

end
