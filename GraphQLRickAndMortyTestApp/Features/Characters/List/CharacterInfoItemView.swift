//
//  CharacterInfoItemView.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import SwiftUI
import FluidGradient
import MySchemaAPI
import Kingfisher

/// A view that displays detailed information about a specific character from the Rick and Morty series.
struct CharacterInfoItemView: View {
    @State private var screenSize = UIScreen.main.bounds.size /// The size of the screen, used to determine layout dimensions.
    @State private var blobs: [Color] = [.green, .green, .purple] /// Colors used in the FluidGradient background for the animated blobs.
    @State private var highlights: [Color] = [.green, .blue, .green] /// Colors used in the FluidGradient background for the highlights.
    
    let character: CharacterFull /// The character data to be displayed, provided from the parent view.
    
    var body: some View {
        ZStack {
            /// Background using a fluid gradient with animated blobs and highlights.
            FluidGradient(blobs: blobs,
                          highlights: highlights,
                          speed: 0.2,
                          blur: 0.75)
            .background(.quaternary)
            .ignoresSafeArea()
            VStack {
                
                ZStack {
                    /// Display the character's image or a placeholder if the image is unavailable.
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                        
                        ZStack {
                            
                            
                            if let image = character.image,
                               let url = URL(string: image) {
                                KFImage(url)
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                Image("testImage")
                                    .resizable()
                                    .scaledToFill()
                            }
                            
                            VStack {
                                Spacer()
                                /// Gradient overlay at the bottom of the image for better text readability.
                                LinearGradient(gradient: Gradient(colors: [.white.opacity(0.0), .black.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                                    .frame(height: screenSize.height / 7)
                            }
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    
                    
                    VStack {
                        Spacer()
                        HStack {
                            /// Display the character's name with a large, monospaced font.
                            Text(character.name ?? "N/A")
                                .foregroundStyle(.white)
                                .fontWeight(.heavy)
                                .font(.system(size: 100))
                                .fontDesign(.monospaced)
                                .lineLimit(3)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(height: screenSize.height / 6)
                                .padding()
                                .padding(.leading, 25)
                                .shadow(radius: 5)
                            Spacer()
                        }
                    }
                }
                .frame(width: screenSize.width ,height: screenSize.height / 2)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                /// A list displaying various details about the character, divided into sections.
                List {
                    /// Section displaying general information about the character.
                    Section {
                        HStack {
                            Text("Status:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(character.status ?? "N/A")
                        }
                        .fontDesign(.monospaced)
                        
                        HStack {
                            Text("Gender:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(character.gender ?? "N/A")
                        }
                        .fontDesign(.monospaced)
                        
                        HStack {
                            Text("Species:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(character.species ?? "N/A")
                        }
                        .fontDesign(.monospaced)
                        
                        HStack {
                            Text("Origin:")
                                .fontWeight(.bold)
                                .padding(.trailing, 50)
                            Spacer()
                            Text(character.origin?.name ?? "N/A")
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                        }
                        .fontDesign(.monospaced)
                        
                        HStack {
                            Text("Location:")
                                .fontWeight(.bold)
                                .padding(.trailing, 50)
                            Spacer()
                            Text(character.location?.name ?? "N/A")
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                            
                        }
                        .fontDesign(.monospaced)
                        
                    } header: {
                        Text("Info")
                            .font(.headline)
                            .fontDesign(.monospaced)
                    }
                    /// Section displaying the episodes in which the character appeared.
                    Section {
                        
                        ForEach(character.episode, id: \.self) { episode in
                            HStack {
                                Text(episode!.id ?? "N/A")
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .padding(.trailing, 50)
                                Spacer()
                                Text(episode!.name ?? "N/A")
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                
                            }
                            .fontDesign(.monospaced)
                        }
                        
                    } header: {
                        Text("Episodes")
                            .font(.headline)
                            .fontDesign(.monospaced)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.white.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .ignoresSafeArea()
            }
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .ignoresSafeArea()
    }
}

