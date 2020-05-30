//
//  ContentView.swift
//  Drinks
//
//  Created by santi on 11/05/20.
//  Copyright © 2020 santi. All rights reserved.
//


import SwiftUI

struct DrinksView: View {
    @State private var listDrinks = [DrinksModel]()
    
    var body: some View {
        NavigationView{
            List(self.listDrinks, id: \.idDrink){ drinks in
                
                VStack{
                    if(drinks.strDrinkThumb != nil){
                        ImageView(withURL: "\(drinks.strDrinkThumb)", width: 350, height: 200, type: 1)
                    }else{
                        ImageView(withURL: "https://www.elcohetealaluna.com/wp-content/uploads/2019/10/ina.png", width: 350, height: 200, type: 1)
                    }
                    HStack{
                        
                        Image(systemName: "bubble.right.fill").font(.system(size: 16, weight: .regular))
                        Text(drinks.strDrink).font(.title)
                    }
                    
                }
            }.navigationBarTitle("Drinks")//list
            .onAppear(perform: getDrinks)
        }//navview
    }
    
    func getDrinks(){
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a")!)//el ! obliga a que no sea nil, si es ? seria opcional
        { (data,_,_) in
            do{
                let drink = try JSONDecoder().decode(DrinksList.self,from: data!)
                DispatchQueue.main.async {
                self.listDrinks = drink.drinks
                }
            }catch{
                print(error)
            }
        }.resume()
    }
}//

