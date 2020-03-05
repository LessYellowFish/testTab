Pod::Spec.new do |s|

s.name        = "testTab"

s.version      = "1.0.2"

s.summary      = "Simple one line code."

s.homepage    = "https://github.com/LessYellowFish/testTab"

s.license      = "MIT"

s.author      = { "LessYellowFish" => "2601958675@qq.com" }

s.platform    = :ios, "7.0"

s.source      = { :git => "https://github.com/LessYellowFish/testTab.git", :tag => s.version }

s.source_files  = "3-1UItableview", "3-1UItableview/*.{h,m}"

s.framework  = "UIKit"

s.requires_arc = true

s.dependency 'Masonry'

end

