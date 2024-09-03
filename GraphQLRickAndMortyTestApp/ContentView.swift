//
//  ContentView.swift
//  GraphQLRickAndMortyTestApp
//
//  Created by Diego Ballesteros on 03/09/24.
//

import SwiftUI
import MySchemaAPI

struct ContentView: View {
    
    @State private var name = ""
    
    var body: some View {
        Text(name)
            .onAppear {
                Network.shared.apollo.fetch(query: CharacterQuery(page: 10)) { result in
                    
                    switch result {
                    case .success(let graphQLResult):
                        DispatchQueue.main.async {
                            if let text = graphQLResult.data?.characters?.results?[0]?.name {
                                self.name = text
                            }
                        }
                        
                        
                    case .failure(let error):
                        print("ERROR: \(error)")
                    }
                    
                }
                    
                }
            }
    }


#Preview {
    ContentView()
}
