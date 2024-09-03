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

struct CharacterSmallPlaceholder {
    var id: String?
    var name: String?
    var image: String?
    var episode: String?
}

class CharacterListViewModel: ObservableObject {
    @Published public var characters: [CharacterSmall]?
    @Published public var error: Error?
    
    
    public var currentPage = 1 {
        didSet {
            fetchCharacters()
        }
    }
    
    public var shouldDisplayNextPage: Bool {
        if characters?.isEmpty == false,
           let totalPages = totalPage,
           currentPage < totalPages {
            return true
        }
        return false
    }
    
    public private(set) var totalPage: Int?
    public private(set) var totalCharacters: Int?
    
    func fetchCharacters() {
        let fetchedPage = currentPage
        Network.shared.apollo.fetch(query: GetCharactersQuery(page: GraphQLNullable<Int>(integerLiteral: currentPage))) { [weak self] result in
            switch result {
            case .success(let result):
                if fetchedPage > 1 {
                    if let newCharacters = result.data?.characters?.results?.compactMap({ $0?.fragments.characterSmall }) {
                        self?.characters?.append(contentsOf: newCharacters)
                    }
                } else {
                    self?.characters = result.data?.characters?.results?.compactMap{ $0?.fragments.characterSmall }
                }
                self?.totalPage = result.data?.characters?.info?.pages
                self?.totalCharacters = result.data?.characters?.info?.count
                
            case .failure(let error):
                self?.error = error
                print("GraphQL query error: \(String(describing: self?.error?.localizedDescription))")
            }
        }
    }
    
}
