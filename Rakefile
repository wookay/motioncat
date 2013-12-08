$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

Motion::Project::App.setup do |app|
  app.name = 'Motion Cat'
  app.info_plist['CFBundleURLTypes'] = [
    { 'CFBundleURLName' => 'com.factor.MotionCat',
	}
  ]
end
