//
//  BaseError.swift
//  Gamy
//
//  Created by Ariel on 03/11/20.
//

import Foundation

enum BaseError: String, Error {
    case INVALID_URL = "URL is invalid! Please check your endpoint"
    case INVALID_REQUEST = "Request data is invalid! Please check your request"
    case INVALID_RESPONSE = "Response is invalid! Please check your endpoint response"
    
    case NETWORK_FAILED = "Network Failure! Please check your connection"
        
    case SERVER_UNREACHABLE = "Server is unreachable! Please check your connection"
    case SERVER_SIDE_ERROR = "Server Error! Please check network request"
    
    case NETWORK_ERROR = "Network error! Please check your connection"
    
    case INTERNAL_ERROR = "Sorry, we having some internal trouble!"
}
