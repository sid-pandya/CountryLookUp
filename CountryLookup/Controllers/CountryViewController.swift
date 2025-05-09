//
//  CountryViewController.swift
//  CountryLookup
//
//  Created by Sidhdharth Pandya on 5/9/25.
//

import UIKit

class CountryViewController: UITableViewController {
    private let viewModel = CountryViewModel()
    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }

    // MARK: - Setup UI
    private func setupUI() {
        title = "Country Lookup"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by Name or Capital"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    // MARK: - Setup Data Binding
    private func setupBindings() {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.center = view.center
        spinner.startAnimating()
        view.addSubview(spinner)
            
        viewModel.onDataUpdated = { [weak self] in
            spinner.stopAnimating()
            spinner.removeFromSuperview()
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableView DataSource
extension CountryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredCountries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CountryCell", for: indexPath) as? CountryTableViewCell
        let country = viewModel.filteredCountries[indexPath.row]
        
        cell?.configure(with: country)
        
        if indexPath.row % 2 == 0 {
            cell?.baseView.backgroundColor = UIColor.systemGray6
        } else {
            cell?.baseView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.05)
        }
        
        return cell ?? UITableViewCell()
    }
}

// MARK: - UISearchResultsUpdating
extension CountryViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        viewModel.filterCountries(by: searchText)
    }
}
