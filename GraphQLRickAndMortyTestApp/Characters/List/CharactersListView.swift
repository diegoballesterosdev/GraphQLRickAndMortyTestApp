//
//  CharactersListView.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import SwiftUI


struct CharactersListView: View {
    @StateObject private var data = CharacterListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if let characters = data.characters {
                    ForEach(characters, id: \.id) { character in
                        
                        Text(character.name ?? "")
//                        NavigationLink(
//                            destination: CharacterDetailView(id: character.id!),
//                            label: {
//                                CharactersListRowView(character: character)
//                            })
                    }
                    if data.shouldDisplayNextPage {
                        nextPageView
                    }
                }
//                ForEach(data.characters ?? Charactesm, id: \.id) { character in
////                    NavigationLink(
////                        destination: CharacterDetailView(id: character.id!),
////                        label: {
////                            CharactersListRowView(character: character)
////                        })
//                }
//                if data.shouldDisplayNextPage {
//                    nextPageView
//                }
            }
            .navigationTitle("Characters")
            .onAppear {
                data.fetchCharacters()
            }
        }
    }
    
    private var nextPageView: some View {
        HStack {
            Spacer()
            VStack {
                ProgressView()
                Text("Loading next page...")
            }
            Spacer()
        }
        .onAppear(perform: {
            data.currentPage += 1
        })
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
