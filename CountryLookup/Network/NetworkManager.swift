//
//  NetworkManager.swift
//  CountryLookup
//
//  Created by Sidhdharth Pandya on 5/9/25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    // Function to fetch countries data
    func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        // URL of the countries JSON file
        guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        // Making a URLSession data task to fetch data
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            // Decoding JSON into an array of Country objects
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                completion(.success(countries))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    // Network error types
    enum NetworkError: Error {
        case invalidURL
        case noData
    }
}
