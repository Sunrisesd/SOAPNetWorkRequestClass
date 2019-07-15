//
//  SOAPNetWorkRequest.swift
//  CocoaPodsManager
//
//  Created by Sunrise on 2019/7/12.
//  Copyright © 2019 ANSO. All rights reserved.
//

import UIKit
import Alamofire

public class SOAPNetWorkRequest: NSObject {

    /// 请求成功的回调     
    public typealias SuccessBlock = (NSData?,String,Bool)->Void
    private var successBlock:SuccessBlock?
    
    /// 请求的命名空间
    private let kNameSpace = "http://tempuri.org/"
    
    public static let shareInstance : SOAPNetWorkRequest = {
        
        let share = SOAPNetWorkRequest()
        
        return share;
    }()
    
    // 请求数据的时候使用这个类就可以
    
    /// soap模式请求
    ///
    /// - Parameters:
    ///   - server: 服务器地址(http://www.baidu.com)
    ///   - action: 请求拼接地址(/data/today)
    ///   - paramValues: 请求参数(键值对字符串:"<key>value</key><key>value</key>")
    ///   - success: 请求返回数据(返回三个值:数据data、请求拼接地址、成功状态)
    public func soapRequest(server:String,action:String,paramValues:String,success:@escaping SuccessBlock) {
        
        self.successBlock = success
        
        let URL = getURL(action: action,server: server)
        
        let soapMsg:String = toSoapMessage(action: action, pams: paramValues)
        
        let urlRequest: URLRequest = getURLRequest(action, URL: URL as URL, soapMsg: soapMsg)
        
        request(urlRequest).responseData { response in
            
            if response.result.isSuccess{
            
                if let successful = self.successBlock {
                    
                    successful(response.data! as NSData, action,true)
                    
                }else {
                    
                    success(nil,action,false)
                }
                
            }else{
                
                print("请求数据失败----》\(response.result.error ?? "" as! Error)")
                
                success(nil,action,false)
            }
        }
    }
    
    private func getURLRequest(_ action:String, URL:Foundation.URL,soapMsg:String) -> URLRequest{
        
        var request:URLRequest = URLRequest(url: URL)
        request.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let soapAction = kNameSpace+action
        request.setValue(soapAction, forHTTPHeaderField: "SOAPAction")
        request.setValue("\(soapMsg.count)", forHTTPHeaderField: "Content-Length")
        request.httpMethod = "POST"
        request.httpBody = soapMsg.data(using: String.Encoding.utf8)
        return request
    }
    
    /*
     Param:
     action: 服务端口 eg.  GetProduct
     Return: "http://192.168.2.17:9090/ProductService.asmx?op=GetProduct"
     */
    private func getURL(action:String, server:String) -> NSURL{
        
        let urlStr = server + "?op=" + action
        
        return NSURL(string: urlStr)!
    }
    
    /*
     Description: 拼接请求的字符串
     
     Param:
     action:服务端口 eg.  GetProduct
     pams:需要上传的参数
     Return: 字符串
     */
    private func toSoapMessage(action: String, pams: String) -> String {
        
        var message: String = String()
        message += "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        message += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
        message += "<soap:Body>"
        message += "<\(action) xmlns=\"\(kNameSpace)\">"
        message += "\(pams)"
        message += "</\(action)>"
        message += "</soap:Body>"
        message += "</soap:Envelope>"
        
        return message
    }
}
