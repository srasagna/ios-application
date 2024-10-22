//
//  NetworkLayer.swift
//  IOSApp
//
//  Created by INFOMERICA1 on 26/06/24.
//

import Foundation

class NetworkLayer {
    
    
    func performAPICall<R: Decodable>(with endpoint: Endpoints, type: R.Type, onSuccess: ((R) -> Void)?, onFailure: ((String) -> Void)? ) {
       
        guard let url  = URL(string: endpoint.getURlString()) else {
            onFailure?("Invalid URL")
            return
        }
        
       var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.getMethod()
        
        if let jsonBody = endpoint.getRequestBody(){
            urlRequest.httpBody = jsonBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        URLSession.shared.dataTask(with: urlRequest){data, response, error in
            
            DispatchQueue.main.async{   
                
                if let errorUW = error {
                    onFailure?(errorUW.localizedDescription)
                    return
                }
                
                guard  let dataUW = data  else {
                    onFailure?("Invalid data from API")
                    return
                }
                
                let responseModel = try? JSONDecoder().decode(R.self, from: dataUW)
                
        guard let responseModelUW = responseModel else {
                    onFailure?("")
                    return

                }  
                
                
                
                onSuccess?(responseModelUW)
                
            }
        
        }.resume()
    }
    
}
//
//
//
//
//
