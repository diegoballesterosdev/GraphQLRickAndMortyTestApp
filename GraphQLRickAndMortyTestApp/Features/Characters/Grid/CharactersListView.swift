//
//  CharactersListView.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import SwiftUI
import FluidGradient
import Shimmer
import MySchemaAPI


struct CharactersListView: View {
    @StateObject private var data = CharactersListViewModel()
    @State private var characters: [CharacterFull]?
    @State private var showingAlert = false
    @State private var errorMessage = ""
    @State private var blobs: [Color] = [.green, .green, .purple]
    @State private var highlights: [Color] = [.green, .blue, .green]
    @State private var screenSize = UIScreen.main.bounds.size /// The size of the screen, used to determine layout dimensions.
    @State private var showCharacters = false
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                FluidGradient(blobs: blobs,
                              highlights: highlights,
                              speed: 0.2,
                              blur: 0.75)
                .background(.quaternary)
                .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack {
                        if let characters = data.characters {

                            ForEach(characters, id: \.self) { character in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.black.opacity(0.2))
                                        .padding(2)
                                    
                                    NavigationLink {
                                        CharacterInfoItemView(character: character)
                                    } label: {
                                        ChatactersListItemView(character: character)
                                            .padding(8)
                                            .shadow(color: .black, radius: 2)
                                    }
                                    
                                    
                                }
                                .transition(.scale)
                            }
                            
                            if data.shouldDisplayNextPage {
                                nextPageView
                            }
                            
                        } else {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: screenSize.width / 2.5)
                                .shimmering()
                                .padding(2)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: screenSize.width / 2.5)
                                .shimmering()
                                .padding(2)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: screenSize.width / 2.5)
                                .shimmering()
                                .padding(2)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: screenSize.width / 2.5)
                                .shimmering()
                                .padding(2)
                            
                        }
                    }
                    
                }
                .padding(.horizontal, 10)
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .toolbarBackground(.gray.opacity(0.1))
                
            }
            .navigationBarTitleDisplayMode(.inline)
            
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
                withAnimation {
                    showingAlert = true
                }
                
            }
        }
        
    }
    
    private var nextPageView: some View {
        HStack {
            Spacer()
            VStack {
                //                ProgressView()
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: screenSize.width / 2.5)
                    .shimmering()
                    .padding(2)
            }
            Spacer()
        }
        .onAppear(perform: {
            data.currentPage += 1
        })
    }
}

struct CharactersGridView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
