//
//  InProgressTableViewDataSource.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/08.
//

import Foundation
import UIKit

class InProgressTableViewDataSource: NSObject, UITableViewDataSource {
    var cardManager = CardManager.shared
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cardManager.count(states: .InProgress)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell") as? CardCell
        else {
            return UITableViewCell()
        }
        
        cardManager.setCell(states: .InProgress, index: indexPath.section) { card in
            cell.title.text = card.title
            cell.contents.text = card.body
            cell.author.text = card.author
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cardManager.remove(states: .InProgress, at: indexPath.section)
            tableView.reloadData()
        }
    }
}
