//
//  BindingTableViewCell.swift
//  MVVM
//
//  Created by Somsak Kaeworasan on 16/7/2564 BE.
//

import UIKit

class BindingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "cell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureView(name: String?){
        self.nameLabel?.text = name
    }
}
