//
//  ViewController.swift
//  MVVM
//
//  Created by somsak on 29/5/2564 BE.
//

import UIKit

//MARK:- MVVM Detail
//M -> Model : it conatint data/info for our app.
//V -> View/ViewController: it represents the UI and data displayed to user.
//VM -> View Model : it acts as a bridge between modell and view and conatins business logic for the view.

//MARK: ViewController
class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBAction func submitTouch(_ sender: Any) {
        fetchingLogin(username: usernameTextField.text!, password: passwordTextField.text!)
    }
    
    private var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = ViewModel(view: self)
    }
    
    private func fetchingLogin(username: String, password: String){
        self.viewModel.fetchingLogin(username: username, password: password)
    }
    
}

//MARK: Delegate
extension ViewController: ViewModelDelegate {
    
    func fetchedLogin() {
        self.statusLabel.text = "Success."
        self.viewModel.showData()
    }
    
    func showData(data: User) {
        self.dataLabel.text = "\(data.username ?? "") \(data.password ?? "")"
    }
}

