Pod::Spec.new do |s|
  s.name         = "SpaceShuttle"
  s.version      = "1.0.0"
  s.summary      = "Manage all your navigations"

  s.description  = <<-DESC
                   A easy way to manage all your navigations. With SpaceShuttle, you can easily pass value across view controller
                   DESC

  s.homepage     = "https://github.com/Draveness/SpaceShuttle"
  s.license      = "MIT"
  s.author             = { "Draveness" => "stark.draven@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/Draveness/SpaceShuttle.git", :tag => s.version }
  s.source_files  = "Classes/*.{h,m}"
  s.public_header_files = "Classes/SpaceShuttle.h"
end
