//
//  LoginViewController.swift
//  CoreDataWithMVC
//
//  Created by PGK Shiva Kumar on 25/07/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginViewOutet: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loginViewOutet.setupUI()
    }
    
    func configureUI(){
        loginViewOutet.delegate = self
    }
}

extension LoginViewController : LoginViewDelegate{
    func goToLogin() {
        if let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController{
            loginViewOutet.saveData()
            loginViewOutet.fetchData()
            loginViewOutet.getAllData()
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func goToRegister() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
