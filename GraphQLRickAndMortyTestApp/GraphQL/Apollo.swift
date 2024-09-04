//
//  Apollo.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import Foundation
import Apollo

/// A singleton class that provides an instance of ApolloClient for interacting with the GraphQL API.
class Network {
    /// The shared singleton instance of the Network class.
    static let shared = Network()
    
    /// The ApolloClient instance used to perform GraphQL queries and mutations.
    /// It is initialized with the URL of the Rick and Morty GraphQL API.
    lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
