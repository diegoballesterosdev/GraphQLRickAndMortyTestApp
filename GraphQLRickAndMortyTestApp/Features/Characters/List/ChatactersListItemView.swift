//
//  ChatactersGridItemView.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import SwiftUI
import Kingfisher
import MySchemaAPI
import FluidGradient

/// A view that displays a character's details in a list item format.
struct ChatactersListItemView: View {
    
    let character: CharacterFull /// The character data to be displayed.
    
    @State private var screenSize = UIScreen.main.bounds.size /// The size of the screen, used to determine layout dimensions.
    @State private var animation = false /// A state variable that controls the animation of the status symbol.
    @State private var statusColor = Color(.green) /// The color representing the character's status (e.g., Alive, Dead, Unknown).
    
    
    var body: some View {
        VStack {
            ZStack {
                
                /// Background image with a blur effect if the character has an image, otherwise a placeholder image.
                if let image = character.image,
                   let url = URL(string: image) {
                    KFImage(url)
                        .resizable()
                        .blur(radius: 20)
                } else {
                    Image("testImage")
                        .resizable()
                }
                
                HStack {
                    ZStack {
                        HStack {
                            /// Character image or a placeholder, scaled and shadowed.
                            if let image = character.image,
                               let url = URL(string: image) {
                                KFImage(url)
                                    .resizable()
                                    .scaledToFill()
                                    .shadow(radius: 4)
                                    .frame(width: screenSize.width / 1.9)
                                
                            } else {
                                Image("testImage")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 4)
                            }
                            
                            Spacer()
                        }
                        
                        VStack {
                            Spacer()
                            /// A gradient overlay at the bottom of the image.
                            HStack {
                                LinearGradient(gradient: Gradient(colors: [.white.opacity(0.0), .black]), startPoint: .top, endPoint: .bottom)
                                    .frame(width: screenSize.width / 1.9, height: 60)
                                Spacer()
                            }
                        }
                        
                        VStack {
                            Spacer()
                            HStack {
                                /// Status symbol with different animations based on the character's status.
                                Image(systemName: character.status != "Dead" ? "circle.fill" : "circle.slash.fill")
                                    .if(character.status == "Alive", transform: { view in
                                        view
                                            .symbolEffect(.bounce, options: .repeating, value: animation)
                                    })
                                    .if(character.status == "unknown", transform: { view in
                                        view
                                            .symbolEffect(.pulse.wholeSymbol, options: .repeating, value: animation)
                                    })
                                
                                    .foregroundColor(statusColor)
                                    .shadow(color: statusColor, radius: 3)
                                    .onAppear {
                                        animation = true
                                        /// Set the status color based on the character's status.
                                        switch character.status ?? "" {
                                        case "Alive":
                                            statusColor = .green
                                        case "Dead":
                                            statusColor = .red
                                        case "unknown":
                                            statusColor = .black.opacity(0.4)
                                        default:
                                            statusColor = .gray
                                        }
                                    }
                                
                                /// Status text displayed next to the status symbol.
                                Text(character.status ?? "")
                                    .textCase(.uppercase)
                                    .font(.title)
                                    .fontDesign(.monospaced)
                                
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .shadow(color: .black, radius: 2)
                                
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, 30)
                        .padding(.leading, 10)
                    }
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: screenSize.width / 1.8)
                        VStack(alignment: .leading) {
                            /// Display the character's name.
                            Text(character.name ?? "")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .lineLimit(3)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                            
                            
                            Spacer()
                            VStack(alignment: .leading) {
                                /// Display the character's species.
                                HStack {
                                    Text("Species:")
                                        .fontWeight(.bold)
                                        .minimumScaleFactor(0.2)
                                    Text(character.species ?? "")
                                        .minimumScaleFactor(0.2)
                                }
                                /// Display the character's gender.
                                HStack {
                                    Text("Gender:")
                                        .fontWeight(.bold)
                                        .minimumScaleFactor(0.2)
                                    Text(character.gender ?? "")
                                        .minimumScaleFactor(0.2)
                                }
                                
                            }
                            .textCase(.uppercase)
                            .font(.subheadline)
                            .frame(height: 50)
                        }
                        .fontDesign(.monospaced)
                        .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .frame(height: screenSize.width / 2.5)
            }
        }
        .frame(height: screenSize.width / 2.5)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
}



