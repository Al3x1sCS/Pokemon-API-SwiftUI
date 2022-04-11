//
//  Pokemonimage.swift
//  PokedexSwiftUI
//
//  Created by user216592 on 4/11/22.
//

import SwiftUI
import Kingfisher

struct Pokemonimage: View {
    var image: KFImage
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .background(Circle().foregroundColor(.white))
            .shadow(radius: 5)
        
    }
}

struct Pokemonimage_Previews: PreviewProvider {
    static var previews: some View {
        Pokemonimage(image: KFImage(URL(string: PokemonViewModel().MOCK_POKEMON.imageURL)))
    }
}
