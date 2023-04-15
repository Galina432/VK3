//
//  GroupViewModelFactory.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 13.04.2023.
//

import UIKit

final class GroupViewModelFactory {
    
    func constructViewModels(from group: [Group]) -> [GroupViewModel] {
        return group.compactMap(viewModel)
    }
    
    private func viewModel(from group: Group) -> GroupViewModel {
        return GroupViewModel(nameText: group.name,
                              avatarImageUrl: group.avatar)
    }
}
