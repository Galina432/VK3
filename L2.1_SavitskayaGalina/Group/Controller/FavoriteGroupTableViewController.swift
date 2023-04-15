//
//  FavoriteGroupTableViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 22.04.2022.

import UIKit

class FavoriteGroupTableViewController: UITableViewController {
    var groups = [Group]()
    var viewModels: [GroupViewModel] = []
    var unchangedViewModels: [GroupViewModel] = []

    private let groupService = GroupsAdapter()
    private let viewModelFactory = GroupViewModelFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupService.getGroups { [weak self] groups in
            guard let self else { return }
            self.groups = groups
            self.viewModels = self.viewModelFactory.constructViewModels(from: groups)
            self.unchangedViewModels = self.viewModels
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        groups.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return groups.count
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        
        cell.configure(group: viewModels[indexPath.row])
        return cell
        
//        cell.groupNameLabel.text = groups[indexPath.row].name
//
//        if let imgUrl = URL(string: groups[indexPath.row].avatar) {
//                cell.groupImageView.load(url: imgUrl)
//            }
    }
}
