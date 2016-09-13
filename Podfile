platform :ios, '8.0'

def testing_pods
    use_frameworks!
    pod 'Nimble', :git => 'https://github.com/Quick/Nimble.git'
    pod 'Quick', :git => 'https://github.com/Quick/Quick.git', :branch => 'swift-3.0'
end

target 'Cartography-iOS-Tests' do
    testing_pods
end

target 'Cartography-Mac-Tests' do
    testing_pods
end

target 'Cartography-tvOS-tests' do
    testing_pods
end

