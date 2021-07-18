//
//  TableViewCell.swift
//  MVVM
//
//  Created by Somsak Kaeworasan on 16/7/2564 BE.
//

import UIKit

//MARK: TableViewCellDelegate
protocol TableViewCellDelegate: AnyObject {
    func personFollowing(
        cell: TableViewCell,
        didTap: TableViewModel
        )
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    static let identifier = "cell"
    var delegate: TableViewCellDelegate?
    private var viewModel: TableViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.nameLabel.text = nil
        self.button.backgroundColor = nil
        self.button.setTitle(nil, for: .normal)
    }
    
    // New view model.
    @objc private func didTapButton(){
        guard let viewModel = self.viewModel else {
            return
        }
        
        var newViewModel = viewModel
        newViewModel.followState = !self.viewModel!.followState
        
//        self.delegate?.personFollowing(
//            cell: self,
//            didTap: newViewModel
//        )
        
//        prepareForReuse()
        
        configureView(viewModel: newViewModel)
    }
    
    func configureView(viewModel: TableViewModel){
        self.viewModel = viewModel
        self.nameLabel?.text = viewModel.name
        
        if viewModel.followState {
            self.button.setTitle("unFollow", for: .normal)
            self.button.backgroundColor = .white
        }else{
            self.button.setTitle("follow", for: .normal)
            self.button.backgroundColor = .red
        }
    }
}
