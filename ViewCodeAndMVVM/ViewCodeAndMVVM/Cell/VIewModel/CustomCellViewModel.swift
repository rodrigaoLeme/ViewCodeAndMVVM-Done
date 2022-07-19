//
//  CustomCellViewModel.swift
//  ViewCodeAndMVVM
//
//  Created by IATec - Rodrigo Leme on 13/07/22.
//

import UIKit

enum DescriptionCustomCell: String {
    case name = "Nome: "
    case profession = "Profissão: "
    case salary = "Salário: R$ "
    case age = "Idade: "
}

class CustomCellViewModel {
    private var data:User
    
    init(data:User) {
        self.data = data
    }
    
    public var getUser:User {
        return self.data
    }
    
    public var getName: String {
        return DescriptionCustomCell.name.rawValue + self.data.name
    }
    
    public var getProfession: String {
        return DescriptionCustomCell.profession.rawValue + self.data.profession
    }
    
    public var getSalary: String {
        return DescriptionCustomCell.salary.rawValue + self.data.salary
    }
    
    public var getAge: String {
        return DescriptionCustomCell.age.rawValue + String(self.data.age)
    }
    
    public var getUserImage: String {
        return self.data.imageUser
    }
    
    public var isEnableHeart: Bool {
        return self.data.isEnableHeart
    }
    
    public func exchangeHeartState(_ value: Bool) {
        self.data.isEnableHeart = value
    }
}
