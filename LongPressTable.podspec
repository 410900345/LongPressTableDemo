Pod::Spec.new do |s|
  s.name         = 'LongPressTable'
  s.version      = '1.0.1'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/sukeyang/LongPressTableDemo'
  s.authors      = {'Suk' => '410900345@qq.com'} 
  s.summary      = 'Long press delete tableviewCell'

  s.platform     =  :ios, '6.0'
  s.source       = {:git => 'https://github.com/sukeyang/LongPressTableDemo.git', :tag => s.version} 
  s.source_files = 'LongPressTableCell/**/*.{h,m}'
  s.frameworks   =  'Foundation','CoreGraphics', 'UIKit'
  s.requires_arc = true
  
# Pod Dependencies

end