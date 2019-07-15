Pod::Spec.new do |s| 
  s.name         = "SOAPNetWorkRequest"				#SDK名称
  s.version      = "1.0.0"                        		#版本号
  s.homepage     = "https://github.com/Sunrisesd"  		#工程主页地址
  s.summary      = "基于Alamofire库的SOAP网络请求类"  		#项目的简单描述
  s.license  	 = "MIT"  					#协议类型
  s.author       = { "Sunrisesd" => "w325731718@163.com" }	#作者及联系方式
  s.platform     = :ios  					#支持的平台
  s.platform     = :ios, "8.0"   				#平台及版本
  s.ios.deployment_target = "8.0"     				#最低系统版本
  s.swift_version = "5.0"	 				#支持swift版本
  s.source       = { :git => "https://github.com/Sunrisesd/SOAPNetWorkRequestClass.git" ,:tag => "#{s.version}"}   	#工程地址及版本号
  s.requires_arc = true   					#是否必须arc
  s.source_files = "SOAPNetWorkRequest.swift"   		#SDK实际的重要文件路径
  s.dependency     "Alamofire"

  #s.frameworks   = "UIKit","Foundation"   #需要导入的frameworks名称，注意不要带上frameworks
  #s.dependency "AFNetworking" #依赖的第三方库
  #s.dependency "YYCache"      #依赖的第三方库


  #- name -> pod库的名称
  #- mudule_name -> 引用的module名称即工程创建的target名，如果和上述的name不一致的话需要指定，如果一样可  以省略
  #- version -> 版本，和GitHub代码的tag一致
  #- summary -> pod库的简单介绍
  #- description -> pod库的详细描述，它的长度一定要比summary长，不要会有警告
  #- homepage -> GitHub访问路径
  #- license -> 遵循的授权版本
  #- author -> 作者，一般是自动生成
  #- platform -> 操作系统及最低支持版本，可指iOS/tvOS/watchOS/tvOS
  #- swift_version -> 如果用的是Swift，指定你使用的版本，因为pod在进行代码检查时的版本可能与你的不一致
  #- source -> GitHub代码仓库地址，请copy使用HTTPS的那个git地址，使用SSL的需要依赖环境，校验无法通过
  #- source_files -> 库的有用文件，它会告诉pod需要克隆哪些文件，*代表任意文件
  #- 其他，生成的.podspec文件包含了很多其他参数，可以根据自己的需求打开某些注释，打造属于你自己的podspec


end