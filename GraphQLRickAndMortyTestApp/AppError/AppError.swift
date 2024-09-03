//
//  AppError.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import Foundation

//Types of errors that can be handled
enum AppError: Error {
    case serviceError(error: Error)
    case invalidURL
    case missingData
    case unexpectedError
    case parseError
}

extension AppError {
    var errorDescription: String? {
        switch self {
        case .serviceError(let error):
            return NSLocalizedString("\(error.localizedDescription)", comment: "Service Error")
        case .invalidURL:
            return NSLocalizedString("APP-ERROR", comment: "Invalid URL Error")
        case .missingData:
            return NSLocalizedString("APP-ERROR", comment: "Missing Data Error")
        case .unexpectedError:
            return NSLocalizedString("APP-ERROR", comment: "Unexpected Error, try awain later")
        case .parseError:
            return NSLocalizedString("APP-ERROR", comment: "Parse Error")
        }
    }
}
