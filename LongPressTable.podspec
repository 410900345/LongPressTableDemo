Pod::Spec.new do |s|
  s.name         = 'LongPressTable'
  s.version      = '1.0.0'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/410900345/LongPressTableDemo'
  s.authors      = {'Suk' => '410900345@qq.com'} 
  s.summary      = 'long press delete tableviewCell'

  s.platform     =  :ios, '6.0'
  s.source       = {:git => 'https://github.com/410900345/LongPressTableDemo.git', :tag => s.version} 
  s.source_files = 'LongPressTableCell/**/*.{h,m}'
  s.frameworks   =  'Foundation','CoreGraphics', 'UIKit'
  s.requires_arc = true
  
# Pod Dependencies

end