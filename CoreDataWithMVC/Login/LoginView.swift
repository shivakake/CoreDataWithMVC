//
//  LoginView.swift
//  CoreDataWithMVC
//
//  Created by PGK Shiva Kumar on 25/07/21.
//

import Foundation
import UIKit
import CoreData

protocol LoginViewDelegate{
    func goToLogin()
    func goToRegister()
}

class LoginView : UIView{
    
    @IBOutlet weak var emailTFOutlet : UITextField!
    @IBOutlet weak var passwordTFOutlet : UITextField!
    
    @IBOutlet weak var registerButtonOutlet : UIButton!
    @IBOutlet weak var loginButtonOutlet : UIButton!
    
    var delegate : LoginViewDelegate?
    
    
    func setupUI(){
        registerButtonOutlet.layer.cornerRadius = 5
        loginButtonOutlet.layer.cornerRadius = 5
    }
    
    func saveData(){
        if let emailText = emailTFOutlet.text , let passwordText = passwordTFOutlet.text{
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                let persistanceContainer = appDelegate.persistentContainer
                let context = persistanceContainer.viewContext
                
                if let entity = NSEntityDescription.entity(forEntityName: "User", in: context){
                    let user = NSManagedObject.init(entity: entity, insertInto: context)
                    user.setValue(emailText, forKey: "email")
                    user.setValue(passwordText, forKey: "password")
                    do {
                        try context.save()
                    } catch  {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    
    func fetchData(){
        if let emailText = emailTFOutlet.text{
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                let persistentContainer = appDelegate.persistentContainer
                let context = persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
                fetchRequest.returnsObjectsAsFaults = false
//                fetchRequest.predicate = NSPredicate(format: "email == %@", argumentArray: emailText)
                fetchRequest.predicate = NSPredicate(format: "email == %@", emailText)
                
                do {
                    try context.fetch(fetchRequest) as? [User]
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getAllData(){
        if let emailText = emailTFOutlet.text{
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                let persistentContainer = appDelegate.persistentContainer
                let context = persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
                fetchRequest.returnsObjectsAsFaults = false
                
                do {
                    try context.fetch(fetchRequest) as? [User]
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func registerButtonTapped(_ sender : UIButton){
        delegate?.goToRegister()
    }
    
    @IBAction func loginButtonTapped(_ sender : UIButton){
        delegate?.goToLogin()
    }
    
}
