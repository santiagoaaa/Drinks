//
//  DrinksModel.swift
//  Drinks
//
//  Created by santi on 11/05/20.
//  Copyright © 2020 santi. All rights reserved.
//

import SwiftUI

struct DrinksList : Codable{
    var drinks : [DrinksModel]
}

struct DrinksModel: Codable {
    var idDrink : String
    var strDrink : String
    var strCategory : String
    var strGlass : String
    var strInstructions : String
    var strDrinkThumb : String
}
