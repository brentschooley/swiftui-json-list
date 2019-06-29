//
//  ContentView.swift
//  ListFromJson
//
//  Created by Brent Schooley on 6/28/19.
//  Copyright © 2019 Brent Schooley. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var networkingManager = NetworkingManager()
    
    var body: some View {
        List(networkingManager.pokemonList.results.identified(by: \.url)) { pokemon in
            Text(pokemon.name.capitalized)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
