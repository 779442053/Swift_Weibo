platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

target ‘SinaWeibo-Swift’ do

pod 'AFNetworking', '~> 3.1.0'

end

post_install do |installer|

installer.pods_project.targets.each do |target|

target.build_configurations.each do |config|

config.build_settings['ENABLE_BITCODE'] = 'NO'

end

end

end
