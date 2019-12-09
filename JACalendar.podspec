#
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JACalendar'
  s.version          = '0.1.0'
  s.summary          = 'JACalendar is a simple `Calendar` component library, this will be used to choose the date from the calender.'

  s.description      = 'JACalendar is a simple `Calendar` component library, this will be used to choose the date from the calender. This can be customized as per the customer requirement using theme colors.'

  s.homepage         = 'https://github.com/JayachandraA/JACalendar'
  s.screenshots     = 'https://raw.githubusercontent.com/JayachandraA/JACalendar/master/Example/JACalendar/custom.png', 'https://raw.githubusercontent.com/JayachandraA/JACalendar/master/Example/JACalendar/default.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JayachandraA' => 'ajchandra15@Gmail.com' }
  s.source           = { :git => 'https://github.com/JayachandraA/JACalendar.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ajchandra15'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JACalendar/Classes/**/*'
  
  #s.resource_bundles = {
  #   'JACalendar' => ['JACalendar/Assets/*.png']
  #}
end
