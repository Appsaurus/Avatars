Pod::Spec.new do |s|
  s.name             = "Avatars"
  s.summary          = "A short description of Avatars."
  s.version          = "0.1.1"
  s.homepage         = "github.com/Strobocop/Avatars"
  s.license          = 'MIT'
  s.author           = { "Brian Strobach" => "brian@appsaurus.io" }
  s.source           = {
    :git => "https://github.com/Appsaurus/Avatars.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/Strobocop'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.2'
  s.watchos.deployment_target = "3.0"

  s.requires_arc = true
  s.ios.source_files = 'Sources/{iOS,Shared}/**/*'
  s.tvos.source_files = 'Sources/{iOS,tvOS,Shared}/**/*'
  s.osx.source_files = 'Sources/{macOS,Shared}/**/*'
  s.watchos.source_files = 'Sources/{watchOS,Shared}/**/*'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.1' }
end
