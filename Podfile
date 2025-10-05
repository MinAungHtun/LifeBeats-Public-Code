# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'LifeBeats' do
  
  use_frameworks!

	pod 'Firebase/Analytics'
    pod 'Firebase/Crashlytics'
        
    use_frameworks!

	
	pod 'Firebase/Auth'
	pod 'Firebase/Storage'
	pod 'Firebase/Firestore'
	pod 'Firebase/Messaging'
	pod 'FirebaseFirestoreSwift'
	pod 'GoogleSignIn'
    pod 'Google-Mobile-Ads-SDK'
    pod 'Alamofire', '~> 4.0'
    pod 'Purchases', '3.10.1'
	
    post_install do |installer|
        installer.pods_project.targets.each do |target|
            if ['SwiftCloudant'].include? target.name
                target.build_configurations.each do |config|
                    config.build_settings['SWIFT_VERSION'] = '3.2'
                end
            end
        end
    end
 

end

