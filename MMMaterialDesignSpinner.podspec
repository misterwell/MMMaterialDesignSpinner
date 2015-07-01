#
# Be sure to run `pod lib lint MaterialDesignSpinner.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MMMaterialDesignSpinner"
  s.version          = "0.2.1"
  s.summary          = "An iOS activity spinner modeled after Google's Material Design spinner"
  s.description      = <<-DESC
                        I love Google's new indeterminate spinner in the [Material Design guidelines](http://www.google.com/design/spec/components/progress-activity.html#progress-activity-types-of-indicators), and I hadn't found a recreation of it for iOS yet, so I created it using CoreGraphics and CoreAnimation, which makes it super lightweight, smooth, and scalable to large sizes.

                        Special thanks to the following projects and articles that helped me create this:
                        * [Google Material Design's Animated Loading Spinner Using HTML, CSS and SVG](http://david.ingledow.co.uk/blog/google-material-designs-animated-loading-spinner-svg-and-css/) for help figuring out exactly what animations were going on.
                        * [LLARingSpinnerView](https://github.com/lipka/LLARingSpinnerView) as the base for a custom activity spinner UIView.
                        * [center-vfl](https://github.com/evgenyneu/center-vfl) because centering things with Auto Layout's VFL is way harder than it should be to remember.
                        * [kylefox / color.m gist](https://gist.github.com/kylefox/1689973) for creating random UIColor values.
                       DESC
  s.homepage         = "https://github.com/misterwell/MMMaterialDesignSpinner"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mike Maxwell" => "misterwell@gmail.com" }
  s.source           = { :git => "https://github.com/misterwell/MMMaterialDesignSpinner.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/themisterwell'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'MaterialDesignSpinner' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreGraphics'
end
