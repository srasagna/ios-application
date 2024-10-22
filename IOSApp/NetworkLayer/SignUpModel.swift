//
//  SignUpRequest.swift
//  IOSApp
//
//  Created by INFOMERICA1 on 27/06/24.
//

import Foundation
struct SignUpRequestModel: Encodable{
    let userName: String?
    let emailId: String?
    let password: String?
    let phoneNumber: String?
    let address: String?
}

struct SignUpResponseModel: Decodable {
    let message: String?
    let error: String?
    
}
