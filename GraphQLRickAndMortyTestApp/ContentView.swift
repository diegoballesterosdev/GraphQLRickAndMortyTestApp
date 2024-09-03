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
        
        CharactersListView()
        
    }
}


#Preview {
    ContentView()
}
