//
//  RegistrationModel.swift
//  CoreDataWithMVC
//
//  Created by PGK Shiva Kumar on 25/07/21.
//

import Foundation

class RegistrationModel{
    var registrationModel : RegistrationModel?
    var registrationData : [RegistrationDataStructure] = []
    func getRegistrationData(){
        registrationData = [RegistrationDataStructure(email: "Shiva.kake@gmail.com", password: "1234567890")]
    }
}

struct RegistrationDataStructure {
    var email : String
    var password : String
}
