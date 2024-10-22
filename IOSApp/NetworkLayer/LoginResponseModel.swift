//
//  LoginResponseModel.swift
//  IOSApp
//
//  Created by INFOMERICA1 on 26/06/24.
//
 
import Foundation

struct LoginResponseModel: Decodable {
    let userDetailsList: [userDetailsList]?
    let uploadedImages: [String]?
    
    
    
}

struct userDetailsList: Decodable {
    let USER_NAME: String?
    let EMAIL_ID: String?
    let PHONE_NUMBER: String?
    let ADDRESS: String?

    
}

