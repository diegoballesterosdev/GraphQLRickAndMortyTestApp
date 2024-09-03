//
//  CharactersListView.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import SwiftUI


struct CharactersListView: View {
    @StateObject private var data = CharacterListViewModel()
    @State private var showingAlert = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationView {
            List {
                if let characters = data.characters {
                    ForEach(characters, id: \.id) { character in
                        Text(character.name ?? "")
                    }
                    
                    if data.shouldDisplayNextPage {
                        nextPageView
                    }
                }
            }
            .navigationTitle("Characters")
        }
        .alert("Something happened", isPresented: $showingAlert, actions: {
            Button("OK", role: .cancel) { }
            Button("Try again") {
                data.error = .none
                data.fetchCharacters()
            }
        }, message: {
            Text(data.error?.localizedDescription ?? "Unknown error")
        })
        
        .onAppear {
            data.fetchCharacters()
        }
        .onChange(of: data.error?.localizedDescription) { oldValue, newValue in
            if let error = data.error {
                errorMessage = error.localizedDescription
                showingAlert = true
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
