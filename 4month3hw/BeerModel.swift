//
//  BeerModel.swift
//  4month3hw
//
//  Created by islam on 13/1/23.
//

import Foundation


struct Beer: Codable {
    var name: String
    var description: String
}



class BeerModel {
    private weak var controller: BeerController!
    
    private var networkManager = NetworkManager()

    
    init(controller: BeerController) {
        self.controller = controller
    }
    
    func getBeers() {
        networkManager.getBeerList { beers in
            self.controller.setBeers(beers: beers)
        }
    }

}


