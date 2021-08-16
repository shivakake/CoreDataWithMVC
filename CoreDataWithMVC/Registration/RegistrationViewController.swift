//
//  RegistrationViewController.swift
//  CoreDataWithMVC
//
//  Created by PGK Shiva Kumar on 25/07/21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //    var registrationView : RegistrationView?
    //    var registrationView : RegistrationView = RegistrationView()
    
    @IBOutlet weak var registrationViewOutlet : RegistrationView!
    
    var regiterModel : RegistrationModel = RegistrationModel()
    var registerArrayList : [RegistrationDataStructure] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI(){
        regiterModel.getRegistrationData()
        let data = regiterModel.registrationData
        registerArrayList = data ?? []
        registrationViewOutlet.setupUI()
        registrationViewOutlet.delegate = self
    }
}
extension RegistrationViewController : RegistrationViewDelegate{
    func goToLogin() {
        if let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    func goToRegister() {
        if let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
//            registrationViewOutlet.saveDataToCoreData()
//                                    registrationViewOutlet.fetchData()
            registrationViewOutlet.fetchAllData()
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
