//
//  ComponentIndexViewController.swift
//  ComponentsCatalog
//

import UIKit

/// Entry screen listing every UIKit demo with search, Dynamic Type and haptics.
final class ComponentIndexViewController: UIViewController {
    private var items = ComponentCatalog.all

    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchResultsUpdater = self
        controller.searchBar.placeholder = "Filter components"
        controller.searchBar.autocapitalizationType = .none
        return controller
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIKit Catalog"
        view.backgroundColor = .systemGroupedBackground
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private static let cellIdentifier = "ComponentCell"
}

extension ComponentIndexViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = item.title
        content.secondaryText = item.subtitle
        content.textProperties.font = .preferredFont(forTextStyle: .headline)
        content.textProperties.adjustsFontForContentSizeCategory = true
        content.secondaryTextProperties.font = .preferredFont(forTextStyle: .subheadline)
        content.secondaryTextProperties.adjustsFontForContentSizeCategory = true
        content.secondaryTextProperties.color = .secondaryLabel
        content.image = UIImage(systemName: item.symbolName)
        content.imageProperties.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title2)
        content.imageProperties.tintColor = .systemIndigo
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        cell.accessibilityHint = item.accessibilityHint
        return cell
    }
}

extension ComponentIndexViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        HapticFeedback.selectionChanged()
        let item = items[indexPath.row]
        let detail = item.makeViewController()
        detail.title = item.title
        navigationController?.pushViewController(detail, animated: true)
    }
}

extension ComponentIndexViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.text ?? ""
        items = ComponentCatalog.filtered(matching: query)
        tableView.reloadData()
    }
}
