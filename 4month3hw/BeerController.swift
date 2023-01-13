//
//  BeerController.swift
//  4month3hw
//
//  Created by islam on 13/1/23.
//

import Foundation


class BeerController {
    
    private weak var view: ViewController!
    
    private var model: BeerModel?
    
    private var beers: [Beer] = [Beer]()
    
    init(view: ViewController!) {
        self.view = view
        self.model = BeerModel(controller: self)
    }
    
    func setBeers(beers: [Beer]) {
        self.beers = beers
        view.beersData = getBeers()
        view.getBeersCollectionView().reloadData()
    }
    
    func getBeers() -> [Beer] {
        return self.beers
    }
    
    func updateBeerList() {
        model?.getBeers()
    }

    
}
