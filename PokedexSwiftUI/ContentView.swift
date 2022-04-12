//
//  ContentView.swift
//  PokedexSwiftUI
//
//  Created by user216592 on 4/11/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @ObservedObject var pokemonVM = PokemonViewModel()
    @State private var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        if searchText == "" { return pokemonVM.pokemon}
        return pokemonVM.pokemon.filter { $0.name.lowercased().contains(searchText.lowercased())}
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPokemon) { poke in
                    NavigationLink(destination: PokemonDetailView(pokemon: poke)) {
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text(poke.name.capitalized)
                                        .font(.title)
                                    if poke.isFavorite {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                }
                                
                                
                                HStack {
                                    Text(poke.type.capitalized)
                                        .italic()
                                    Circle()
                                        .foregroundColor(poke.typeColor)
                                        .frame(width: 10, height: 10)
                                    
                                }
                                Text(poke.description)
                                    .font(.caption)
                                    .lineLimit(1)
                            }
                            
                            Spacer()
                            // MARK: Kingfisher é lindo
                            KFImage(URL(string: poke.imageURL))
                                .interpolation(.none)
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            // MARK: metodo assíncrono
                            /*AsyncImage(url: URL(string: poke.imageURL)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let Image):
                                    Image.resizable()
                                        .interpolation(.none)
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                case.failure:
                                    Image(systemName: "photo")
                                @unknown default:
                                    EmptyView()
                                }
                            }*/
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(action: { addFavorite(pokemon: poke)}) {
                            Image(systemName: "star")
                        }
                        .tint(.yellow)
                    }
                }
            }
            .navigationTitle("Pokemon")
            .searchable(text: $searchText)
        }
        
        /*.onAppear {
            //async
            Task.init {
                pokemon = try! await pokemonVM.getPokemon()
            }
        }*/
    }
    
    func addFavorite(pokemon: Pokemon) {
        if let index = pokemonVM.pokemon.firstIndex(where: {$0.id == pokemon.id }) {
            pokemonVM.pokemon[index].isFavorite.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
