//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 06/09/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    var viewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(.request)
    }
}

extension HomeVC: HomeViewModelDelegate {
    func success() {
        print(#function)
    }
    
    func error() {
        print(#function)
    }
    
    
}
