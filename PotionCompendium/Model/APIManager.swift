//
//  APIManager.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import Foundation

class APIManager {
    let baseURL = "https://wizard-world-api.herokuapp.com"

    static var jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .useDefaultKeys
        return jsonDecoder
    }()

    func getPotions(succesHandler: @escaping ([Potion]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let apiURL = URL(string: "\(baseURL)/elixirs") else { fatalError("missing url")}

        let task = URLSession.shared.dataTask(with: URLRequest(url: apiURL)) { (data, _, error) in
            if error != nil {
                print("Error: \(error!)")
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    errorHandler(NSError(domain: "", code: 0, userInfo: nil))
                }
                return
            }

            do {
                let potions = try APIManager.jsonDecoder.decode([Potion].self, from: data)

                DispatchQueue.main.async {
                    succesHandler(potions)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
