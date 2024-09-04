//
//  SingleQuery.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import Foundation
import Apollo
import ApolloAPI
import SwiftUI

/// A generic class that handles the execution and data retrieval of a single GraphQL query.
/// It is designed to be used as an ObservableObject to automatically update SwiftUI views when data changes.
public class SingleQuery<Query: GraphQLQuery>: ObservableObject {
    @Published public var data: Query.Data? /// The fetched data from the GraphQL query. This property is published, so any changes to it will update SwiftUI views.
    @Published public var error: Error?  /// An optional error object that contains information about any error that occurred during the query execution. This property is also published to allow SwiftUI views to react to errors.

    /// Initializes the SingleQuery class with a specified GraphQL query.
    /// - Parameter query: The GraphQL query to be executed.
    public init(query: Query) {
        loadData(query: query)
    }
    
    /// Executes the provided GraphQL query and handles the result by updating the `data` or `error` properties.
    /// - Parameter query: The GraphQL query to be executed.
    private func loadData(query: Query) {
        Network.shared.apollo.fetch(query: query) { [weak self] result in
            switch result {
            case .success(let result):
                self?.data = result.data
            case .failure(let error):
                self?.error = error
            }
        }
    }
}
