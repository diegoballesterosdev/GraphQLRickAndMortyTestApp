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

/// A view that displays a list of characters, with support for pagination and error handling.
struct CharactersListView: View {
    @StateObject private var data = CharactersListViewModel() /// The view model responsible for fetching and managing character data.
    @State private var showingAlert = false /// A state variable to control the visibility of an alert when an error occurs.
    @State private var errorMessage = "" /// A state variable that holds the error message to be displayed in the alert.
    @State private var blobs: [Color] = [.green, .green, .purple] /// Colors used in the FluidGradient background for the animated blobs.
    @State private var highlights: [Color] = [.green, .blue, .green] /// Colors used in the FluidGradient background for the highlights.
    @State private var screenSize = UIScreen.main.bounds.size /// The size of the screen, used to determine layout dimensions.
    
    var body: some View {
        NavigationView {
            ZStack {
                /// Background using a fluid gradient with animated blobs and highlights.
                FluidGradient(blobs: blobs,
                              highlights: highlights,
                              speed: 0.2,
                              blur: 0.75)
                .background(.quaternary)
                .ignoresSafeArea()
                
                
                ScrollView {
                    LazyVStack {
                        /// Display characters if available, otherwise show shimmering placeholders.
                        if let characters = data.characters {
                            
                            ForEach(characters, id: \.self) { character in
                                ZStack {
                                    /// A rounded rectangle background with slight opacity.
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.black.opacity(0.2))
                                        .padding(2)
                                    
                                    /// Navigation link to character detail view.
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
                            /// Display a loading view when the next page should be loaded.
                            if data.shouldDisplayNextPage {
                                nextPageView
                            }
                            
                        } else {
                            /// Shimmering placeholders for loading state.
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
    
    /// A view that displays a loading indicator when the next page of characters is being fetched.
    private var nextPageView: some View {
        HStack {
            Spacer()
            VStack {
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
