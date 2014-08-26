Pod::Spec.new do |s|
  s.name         = "MZDayPicker"
  s.version      = "0.0.6"
  s.summary      = "An iOS day picker to allow users to select date. (Forked)"

  s.homepage     = "https://github.com/snarshad/MZDayPicker"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Michał Zaborowski" => "m1entus@gmail.com" }

  s.source       = { :git => "https://github.com/snarshad/MZDayPicker.git", :tag => "0.0.6" }
  
  s.source_files = 'MZDayPicker/*.{h,m}'
  
  s.platform     = :ios, '5.0'
  
  s.framework  = 'QuartzCore'
  s.requires_arc = true
end
