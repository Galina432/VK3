//
//  GroupTableViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 22.04.2022.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    @IBOutlet var searchBarGroups: UISearchBar! {
        didSet {
            searchBarGroups.delegate = self
        }
    }
    
    var foundGroups = [Group]()
    var viewModels: [GroupViewModel] = []
    var unchangedViewModels: [GroupViewModel] = []
    
    let groupService = GroupsAdapter()
    private let viewModelFactory = GroupViewModelFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return foundGroups.count
        return viewModels.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
            preconditionFailure("Error cell")
        }
        
        cell.configure2(group: viewModels[indexPath.row])
        return cell
        
//        cell.groupNameLabel2.text = foundGroups[indexPath.row].name
//        if let imgUrl = URL(string: foundGroups[indexPath.row].avatar) {
//                cell.groupImageView2.load(url: imgUrl)
//            }
        
    }
}

extension GroupTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            groupService.getFoundGroups(bySearchText: searchText) { [weak self] groups in
                guard let self else { return }
                self.foundGroups = groups
                self.viewModels = self.viewModelFactory.constructViewModels(from: groups)
                self.unchangedViewModels = self.viewModels
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } else {
            foundGroups = []
            tableView.reloadData()
        }
    }
}

    
    

