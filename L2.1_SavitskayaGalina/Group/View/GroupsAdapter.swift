//
//  GroupsAdapter.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 25.03.2023.
//

import Foundation
import PromiseKit

final class GroupsAdapter {
    
    private let groupsApi = GroupsAPI()
    private let groupsDB = GroupsDB()
    
    func getGroups(completion: @escaping ([Group]) -> Void) {
        firstly {
            groupsApi.loadVkGroups()
        }.done(on: DispatchQueue.main) { groups in
            self.groupsDB.save(groups)
            var groups: [Group] = []
            let realmGroups = self.groupsDB.fetch()
            for realmGroup in realmGroups {
                groups.append(self.group(from: realmGroup))
            }
            completion(groups)
        }.catch { error in
            print(error)
        }
    }
    
    func getFoundGroups(bySearchText searchText: String, completion: @escaping ([Group]) -> Void) {
        groupsApi.searchVkGroups(searchText: searchText) { [weak self] realmGroups in
            let groups = realmGroups.compactMap { self?.group(from: $0) }
            completion(groups)
        }
    }
    
    private func group(from realmGroup: RealmGroup) -> Group {
        return Group(id: realmGroup.id,
                     name: realmGroup.name,
                     avatar: realmGroup.avatar)
    }
}

