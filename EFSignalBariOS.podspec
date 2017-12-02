
Pod::Spec.new do |s|
  s.name             = 'EFSignalBariOS'
  s.version          = '0.1.1'
  s.summary          = 'An awesome Recieved Signal Strength Indicator View'

  s.description      = <<-DESC
Displays signal stregth using an iOS11 style signal bar
                       DESC

  s.homepage         = 'https://github.com/erhiesfeka/EFSignalBariOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Erhies Feka' => 'erhiesfeka@yahoo.com' }
  s.source           = { :git => 'https://github.com/erhiesfeka/EFSignalBariOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'EFSignalBariOS/EFSignalBarView.swift'

end
