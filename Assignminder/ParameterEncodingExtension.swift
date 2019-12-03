//
//  ParameterEncodingExtension.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-12-03.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import Foundation
import Alamofire

extension String: ParameterEncoding {

    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
        return request
    }

}
