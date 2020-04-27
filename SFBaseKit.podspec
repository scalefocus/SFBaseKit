Pod::Spec.new do |spec|

  spec.name         = "SFBaseKit"
  spec.version      = '2.1.1'
  spec.summary      = "Commonly used utilities and extensions, not-contained in native iOS frameworks."
  spec.description  = <<-DESC
  This framework includes Utils, Extensions, BaseClasses and Coordinator approach. Could be used among all projects.
                   DESC
  spec.homepage     = "https://github.com/scalefocus/SFBaseKit"
  spec.license      = 'MIT'
  spec.author       = { "Scalefocus" => "code@upnetix.com" }
  spec.platform     = :ios, "10.0"
  spec.swift_version = '5.0'
  spec.source       = { :git => "https://github.com/scalefocus/SFBaseKit.git", :tag => spec.version.to_s }
  spec.source_files  = 'SFBaseKit/**/*.{swift}'
  spec.exclude_files = "Classes/Exclude"

end
