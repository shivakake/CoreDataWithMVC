//
//  HomeView.swift
//  CoreDataWithMVC
//
//  Created by PGK Shiva Kumar on 25/07/21.
//

import Foundation
import UIKit

protocol HomeViewDelegate {
    func goToNext()
    func goBack()
}
class HomeView : UIView{
    
    @IBOutlet weak var emailLabelOutlet : UILabel!
    @IBOutlet weak var passwordLabelOutlet : UILabel!
    @IBOutlet weak var saveButtonOutlet : UIButton!

    var delegate : HomeViewDelegate?
    
    
    func setupUI(){
        emailLabelOutlet.layer.cornerRadius = 5
        emailLabelOutlet.layer.masksToBounds = true
        emailLabelOutlet.layer.borderWidth = 1
        emailLabelOutlet.layer.borderColor = UIColor.red.cgColor
        passwordLabelOutlet.layer.cornerRadius = 5
        passwordLabelOutlet.layer.masksToBounds = true
        passwordLabelOutlet.layer.borderWidth = 1
        passwordLabelOutlet.layer.borderColor = UIColor.red.cgColor
        saveButtonOutlet.layer.cornerRadius = 5
    }
    
    @IBAction func saveButtonTapped(_ sender : UIButton){
        
    }
    
    @IBAction func backButtonTapped(_ sender : UIButton){
        delegate?.goBack()
    }
    
  
    
}
