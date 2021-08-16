//
//  RegistrationView.swift
//  CoreDataWithMVC
//
//  Created by PGK Shiva Kumar on 25/07/21.
//

import Foundation
import UIKit
import CoreData

protocol RegistrationViewDelegate{
    func goToLogin()
    func goToRegister()
}

class RegistrationView : UIView{
    
    @IBOutlet weak var emailTFOutlet : UITextField!
    @IBOutlet weak var passwordTFOutlet : UITextField!
    @IBOutlet weak var registerButtonOutlet : UIButton!
    @IBOutlet weak var loginButtonOutlet : UIButton!
    
    
    var registerDataArray : [RegistrationModel] = []
    var delegate : RegistrationViewDelegate?
    
    func setupUI(){
        registerButtonOutlet.layer.cornerRadius = 5
        loginButtonOutlet.layer.cornerRadius = 5
    }
    
    func saveDataToCoreData(){
        // Access the data from UITextField
        if let email = emailTFOutlet.text , let password = passwordTFOutlet.text{
            // Access the AppDelegate file for coredata function and veriables.
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            // Access the persistentContainer from coredata veriables in AppDelegate.
            let persistenceContainer = appDelegate.persistentContainer
            // Access the viewContext from coredata in AppDelegate.
            let context = persistenceContainer.viewContext
            // Inisilizing the entity which we created in .XCFolder of Coredata for save data to context.
            guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else { return }
            // insert the entity into context
            let user = NSManagedObject(entity: entity, insertInto: context)
            user.setValue(email, forKey: "email")
            user.setValue(password, forKey: "password")
            
            // Now we have to save the data
            do{
                try context.save()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func saveData(){
        guard let email = emailTFOutlet.text , let password = passwordTFOutlet.text else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let persisteanceContainer = appDelegate.persistentContainer
        let context = persisteanceContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else { return  }
        let user = NSManagedObject.init(entity: entity, insertInto: context)
        user.setValue(email, forKey: "email")
        user.setValue(password, forKey: "password")
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    func fetchData(){
        if let email = emailTFOutlet.text{
            guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let persistenceContainer = appdelegate.persistentContainer
            let context = persistenceContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            fetchRequest.returnsObjectsAsFaults = false
            fetchRequest.predicate = NSPredicate(format: "email == %@", email)
            
            do{
                if let users = try context.fetch(fetchRequest) as? [User] {
                    print(users)
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    func fetchAllData(){
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let persistenceContainer = appdelegate.persistentContainer
        let context = persistenceContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            if let users = try context.fetch(fetchRequest) as? [User] {
                print(users)
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    @IBAction func registerButtonTapped(_ sender : UIButton){
        delegate?.goToRegister()
    }
    @IBAction func loginButtonTapped(_ sender : UIButton){
        delegate?.goToLogin()
    }
}
