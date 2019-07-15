## 关于

-基于Alamofire库的SOAP网络请求类的二次封装，用于网络请求

## 需求

- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+

## 安装

### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'SOAPNetWorkRequestClass'
end
```
## 用法

```swift
import SOAPNetWorkRequestClass

class MyViewController: UIViewController {

override func viewDidLoad() {

    super.viewDidLoad()

    let keyArray = ["name","password","birthday"]
    let valueArray = ["sunrise","123456","2019-07-15"]

    var paramValues = ""

    for i in 0..<keyArray.count {

        let key = keyArray[i]
        let value = valueArray[i]

        paramValues += "<\(key)>"+value+"</\(key)>"
    }

    // paramValues = "<name>sunrise</name><password>123456</password><birthday>2019-07-15</birthday>"

    SOAPNetWorkRequest.shareInstance.soapRequest(server: "http://www.baidu.com", action: "/data/value", paramValues: paramValues) { (valueData, action, state) in


    }

}
```



