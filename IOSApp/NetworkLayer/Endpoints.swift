//
//  Endpoints.swift
//  IOSApp
//
//  Created by INFOMERICA1 on 26/06/24.
//

import Foundation

enum Endpoints {
    case login(emailId: String, password: String)
    case signUp(model: SignUpRequestModel)
    
    func getURlString() -> String {
        switch self {
        case .login(let emailId, let password):
            return "http://localhost:8080/login?emailId=\(emailId)&password=\(password)"
        case .signUp:
            return "http://localhost:8080/signup"
        }
        
    }
    
    func getMethod() -> String {
        switch self {
        case .login:
            return "GET"
            
        case .signUp:
            return "POST"
        }
    }
    
    func getRequestBody() -> Data?{
        guard let body = getBody() else {
            return nil
        }
        guard let jsonData = try? JSONEncoder().encode(body) else{
            return nil
        }
        return jsonData
        
    }
    
   private func getBody() -> Encodable? {
        switch self {
        case .login:
            return nil
        case .signUp(let model):
            return model
        }
        
    }
}
