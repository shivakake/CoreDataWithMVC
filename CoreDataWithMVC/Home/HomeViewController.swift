//
//  HomeViewController.swift
//  CoreDataWithMVC
//
//  Created by PGK Shiva Kumar on 25/07/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var homeViewOutlet: HomeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
        homeViewOutlet.delegate = self
        homeViewOutlet.setupUI()
    }
    
    
    func saveData(){
        
    }
}

extension HomeViewController: HomeViewDelegate{
    func goToNext() {
        print("Something to go")
    }
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
