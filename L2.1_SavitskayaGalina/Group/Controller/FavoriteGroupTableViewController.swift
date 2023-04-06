//
//  FavoriteGroupTableViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 22.04.2022.

import UIKit

class FavoriteGroupTableViewController: UITableViewController {
    
    var groups = [Group]()
    private let groupService = GroupsAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupService.getGroups { [weak self] groups in
            self?.groups = groups
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        groups.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        
        cell.groupNameLabel.text = groups[indexPath.row].name
        
        if let imgUrl = URL(string: groups[indexPath.row].avatar) {
                cell.groupImageView.load(url: imgUrl)
            }
        return cell
    }
}
