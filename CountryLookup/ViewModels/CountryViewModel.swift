//
//  CountryViewModel.swift
//  CountryLookup
//
//  Created by Sidhdharth Pandya on 5/9/25.
//
import Foundation

class CountryViewModel {
    // Private data storage
    private var allCountries: [Country] = []
    private(set) var filteredCountries: [Country] = [] // Accessible but not directly modifiable

    // Closure to notify view about data updates
    var onDataUpdated: (() -> Void)?

    // Initialize and fetch data
    init() {
        fetchCountries()
    }

    // Fetch countries from NetworkManager
    private func fetchCountries() {
        NetworkManager.shared.fetchCountries { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let countries):
                    self?.allCountries = countries
                    self?.filteredCountries = countries
                    self?.onDataUpdated?()
                case .failure(let error):
                    print("Failed to fetch countries: \(error.localizedDescription)")
                }
            }
        }
    }

    // Function to filter countries based on search text
    func filterCountries(by searchText: String) {
        guard !searchText.isEmpty else {
            filteredCountries = allCountries
            onDataUpdated?()
            return
        }

        filteredCountries = allCountries.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.capital.lowercased().contains(searchText.lowercased())
        }
        onDataUpdated?()
    }
}

