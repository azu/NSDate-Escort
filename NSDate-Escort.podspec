
Pod::Spec.new do |s|
  s.name         = "NSDate-Escort"
  s.version      = "1.7.1"
  s.summary      = "A NSDate utility library that is compatible with NSDate-Extensions API."
  s.homepage     = "https://github.com/azu/NSDate-Escort"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "azu" => "azuciao@gmail.com" }
  s.source       = {
    :git => "https://github.com/azu/NSDate-Escort.git",
    :tag => s.version.to_s
  }

  s.default_subspec = 'ObjC'

  s.subspec 'ObjC' do |ss|
    ss.source_files = 'NSDate-Escort/**/*.{h,m}'
    ss.requires_arc = true
  end
  s.subspec 'Swift' do |ss|
    ss.source_files = 'NSDate-Escort/**/*.{swift}'
    ss.requires_arc = true
  end
end
