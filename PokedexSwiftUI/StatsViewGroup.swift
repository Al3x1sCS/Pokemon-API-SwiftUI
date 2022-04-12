//
//  StatsViewGroup.swift
//  PokedexSwiftUI
//
//  Created by user216592 on 4/11/22.
//

import SwiftUI

struct StatsViewGroup: View {
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 250)
                .foregroundColor(.white)
                .opacity(0.6)
                .cornerRadius(20)
            VStack(alignment: .leading, spacing: 30) {
                StatView(pokemon: pokemon, statName: "ATK", statColor: .blue, statValue: pokemon.attack)
                StatView(pokemon: pokemon, statName: "DEF", statColor: .red, statValue: pokemon.defense)
                StatView(pokemon: pokemon, statName: "HGT", statColor: .teal, statValue: pokemon.height)
                StatView(pokemon: pokemon, statName: "WGT", statColor: .cyan, statValue: pokemon.weight)
            }
        }
    }
}

struct StatsViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        StatsViewGroup(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
