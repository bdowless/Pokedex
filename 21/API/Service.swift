//
//  Service.swift
//  21
//
//  Created by Brandon Dowless on 11/5/21.
//
//
//import UIKit
//import Foundation
//
//struct AuthService {
//    static let shared = AuthService()
//
//
//    func fetchData(completionHandler: @escaping ([PokemonObject]) -> Void) {
//        let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json")!
//
//        // Get Data
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data?.removeString() else { return }
//
//
//            do {
//                // Organizing the data we received into our data structure
//                let pokemonData = try JSONDecoder().decode([PokemonObject].self, from: data)
//                DispatchQueue.main.async {
//                    completionHandler(pokemonData)
//                }
//            }
//            catch {
//                let error = error
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
//    }
//
//    extension Data {
//        func removeString() -> Data? {
//            guard let dataString = String(data: self, encoding: .utf8) else { return nil }
//            let newStr = dataString.replacingOccurrences(of: "null,", with: "")
//            return Data(newStr.utf8)
//        }
//    }
//


import UIKit
import Foundation

struct AuthService {

static let shared = AuthService()
    
    func fetchData(completion: @escaping ([Pokemon])-> Void) {
        
        let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.removeString() else { return }
            
            do {
                let pokemonData = try JSONDecoder().decode([Pokemon].self, from: data)
                DispatchQueue.main.async {
                    completion(pokemonData)
                }
            }
            catch {
                let error = error
                print("DEBUG: error is \(error)")
            }
            
        }.resume()
    }

}




extension Data {
        func removeString() -> Data? {
            guard let dataString = String(data: self, encoding: .utf8) else { return nil }
            let newStr = dataString.replacingOccurrences(of: "null,", with: "")
            return Data(newStr.utf8)
        }
}

