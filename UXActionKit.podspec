
Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "UXActionKit"
s.summary = "UXActionKit makes custom action sheets easy"
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Jack Chamberlain" => "jack.chamberlain97@gmail.com" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/jackchmbrln/UXActionKit"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/jackchmbrln/UXActionKit.git", :tag => "#{s.version}"}


# 7
s.framework = "UIKit"

# 8
s.source_files = "UXActionKit/**/*.{swift}"

# 9
s.resources = "UXActionKit/**/*.{png,jpeg,jpg,storyboard,xib}"
end
