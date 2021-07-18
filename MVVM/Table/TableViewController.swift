//
//  TableViewController.swift
//  MVVM
//
//  Created by Somsak Kaeworasan on 16/7/2564 BE.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var models = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModel()
    }
    
    private func configureModel(){
        let nameArray = ["AA", "BB", "CC"]
        
        for nameIndex in nameArray {
            self.models.append(Person(name: nameIndex))
        }
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
                    
        let model = self.models[indexPath.row]
        cell?.configureView(viewModel: TableViewModel(model: model))
        cell?.delegate = self
                    
        return cell!
    }
}

extension TableViewController: TableViewCellDelegate {
    
    func personFollowing(cell: TableViewCell, didTap: TableViewModel) {
        
    }
}
