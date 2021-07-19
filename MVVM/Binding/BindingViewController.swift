//
//  BindingViewController.swift
//  MVVM
//
//  Created by Somsak Kaeworasan on 16/7/2564 BE.
//

import UIKit

//Obserable
class Observable<T> {
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void){
        listener(value)
        self.listener = listener
    }
}

//Model
struct UserModel: Codable {
    let name: String
}

//ViewModel
struct UserListViewModel {
    var users: Observable<[UserTableViewCellViewModel]> = Observable([])
}

struct UserTableViewCellViewModel {
    let name: String
}

//Controller
class BindingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.users.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        fetchData()
    }
    
    func fetchData(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, _, _) in
            guard let data = data else { return }
            
            do {
                let usermodels = try JSONDecoder().decode([UserModel].self, from: data)
                
                self.viewModel.users.value = usermodels.compactMap({
                    UserTableViewCellViewModel(name: $0.name)
                })
            }catch {
                
            }
        }
        
        task.resume()
    }
}

extension BindingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.users.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: BindingTableViewCell.identifier, for: indexPath) as? BindingTableViewCell
                    
        cell?.configureView(name: self.viewModel.users.value?[indexPath.row].name)
                    
        return cell!
    }
}
