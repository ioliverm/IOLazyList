Pod::Spec.new do |s|
  s.name             = "IOLazyList"
  s.version          = "0.1.0"
  s.summary          = "An asynchronous data loading list."
  s.description      = <<-DESC
                       Use IOLazyList to support lazy loading lists.
                       DESC
  s.homepage         = "https://github.com/ioliverm/IOLazyList"
  s.license          = 'MIT'
  s.author           = { "Ivan Oliver" => "ivan.oliver@gmail.com" }
  s.source           = { :git => "https://github.com/ioliverm/IOLazyList.git", :tag => s.version.to_s }
  s.platform         = :ios, '8.0'
  s.requires_arc     = true
  s.source_files = 'Pod/Classes/**/*'
end
