//
//  PokemonAPIList.swift
//  ListFromJson
//
//  Created by Brent Schooley on 6/28/19.
//  Copyright © 2019 Brent Schooley. All rights reserved.
//

import Foundation

//{
//    "count": 964,
//    "next": "https://pokeapi.co/api/v2/pokemon?offset=60&limit=60",
//    "previous": null,
//    "results": [
//    {
//    "name": "bulbasaur",
//    "url": "https://pokeapi.co/api/v2/pokemon/1/"
//    },
//    {
//    "name": "ivysaur",
//    "url": "https://pokeapi.co/api/v2/pokemon/2/"
//    },

struct PokemonAPIList : Decodable {
    var results: [PokemonListEntry]
}

struct PokemonListEntry: Decodable {
    var name: String
    var url: String
}
