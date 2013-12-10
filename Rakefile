$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'sugarcube-repl'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'MotionCat'
  app.vendor_project('vendor/arccat', :xcode,
    :xcodeproj => "arccat.xcodeproj",
    :target => "arccat",
    :products => ["libarccat.a"],
    :headers_dir => "arccat"
  )
  app.info_plist['CFBundleURLTypes'] = [
    { 'CFBundleURLName' => 'com.factor.MotionCat', }
  ]
  app.provisioning_profile = '../../cert/factor_debug.mobileprovision'
end
