//
//  CharactersListViewModel.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import Foundation
import SwiftUI
import Apollo
import ApolloAPI
import MySchemaAPI

/// A view model that manages the state and logic for fetching and storing a list of characters from the Rick and Morty GraphQL API.
class CharactersListViewModel: ObservableObject {
    @Published public var characters: [CharacterFull]? /// The list of characters fetched from the API.
    @Published public var error: Error? /// The error encountered during the GraphQL query, if any.
    
    /// The current page of the character list being fetched.
    public var currentPage = 1 {
        didSet {
            /// Automatically fetch characters when the current page changes.
            fetchCharacters()
        }
    }
    
    /// A boolean value indicating whether the next page of characters should be displayed.
    public var shouldDisplayNextPage: Bool {
        if characters?.isEmpty == false,
           /// Return true if there are characters, total pages are known, and the current page is less than the total pages.
           let totalPages = totalPage,
           currentPage < totalPages {
            return true
        }
        return false
    }
    
    public private(set) var totalPage: Int? /// The total number of pages available for character data.
    public private(set) var totalCharacters: Int?  /// The total number of characters available from the API.

    /// Fetches the characters from the Rick and Morty API for the current page.
    func fetchCharacters() {
        
        let fetchedPage = currentPage
        Network.shared.apollo.fetch(query: GetCharactersQuery(page: GraphQLNullable<Int>(integerLiteral: currentPage))) { [weak self] result in
            switch result {
            case .success(let result):
                /// If fetching a page greater than the first, append new characters to the existing list.
                if fetchedPage > 1 {
                    if let newCharacters = result.data?.characters?.results?.compactMap({ $0?.fragments.characterFull }) {
                        self?.characters?.append(contentsOf: newCharacters)
                    }
                } else {
                    /// Otherwise, replace the characters list with the newly fetched characters.
                    self?.characters = result.data?.characters?.results?.compactMap{ $0?.fragments.characterFull }
                }
                /// Update the total number of pages and characters based on the API response.
                self?.totalPage = result.data?.characters?.info?.pages
                self?.totalCharacters = result.data?.characters?.info?.count
                
            case .failure(let error):
                /// Handle and store the error if the query fails.
                self?.error = error
                print("GraphQL query error: \(String(describing: self?.error?.localizedDescription))")
            }
        }
    }
    
}
