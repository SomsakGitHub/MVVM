//
//  ViewModel.swift
//  MVVM
//
//  Created by somsak on 29/5/2564 BE.
//

import Foundation

//MARK: ViewModelDelegate
protocol ViewModelDelegate {
    func fetchedLogin()
    func showData(data: User)
}

//MARK: ViewModel
class ViewModel {
    
    var user: User!
    
    private var viewModelDelegate: ViewModelDelegate?
    
    init(view: ViewModelDelegate) {
        self.viewModelDelegate = view
    }
    
    func fetchingLogin(username: String, password: String){
        var userData = User()
        userData.username = username
        userData.password = password
        self.user = userData
        self.viewModelDelegate?.fetchedLogin()
    }
    
    func showData(){
        self.viewModelDelegate?.showData(data: self.user)
    }
}
