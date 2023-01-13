//
//  ViewController.swift
//  4month3hw
//
//  Created by islam on 13/1/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var beersData = [Beer]()
    
    private lazy var beersTableView: UITableView = {
        let beersTableView = UITableView()
        beersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        beersTableView.dataSource = self
        beersTableView.delegate = self
        beersTableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 246/255, alpha: 255)
        return beersTableView
    }()
    
    private var controller: BeerController?
    
    private func setupSubivews() {
        view.addSubview(beersTableView)
        beersTableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        controller = BeerController(view: self)
        controller?.updateBeerList()
        setupSubivews()
    }
    
    func getBeersCollectionView() -> UITableView {
        return beersTableView
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = beersTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = beersData[indexPath.row].name
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedController = UIAlertController(title: "Description", message: beersData[indexPath.row].description, preferredStyle: .alert)
        detailedController.addAction(UIAlertAction(title: "OK", style: .default))
        present(detailedController, animated: true)
    }
}

