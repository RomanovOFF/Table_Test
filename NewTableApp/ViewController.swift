//
//  ViewController.swift
//  NewTableApp
//
//  Created by Максим Романов on 23.10.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = ["1", "2","3","4","5","6","7","8","9","10"]
    var myTableView = UITableView()
    let identifire = "cell"
    var allBackgroudColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }

    func createTableView() {
        self.myTableView = UITableView(frame: view.bounds, style: .plain)
        self.myTableView.backgroundColor = allBackgroudColor
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
         
        view.addSubview(myTableView)
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        let number = array[indexPath.row]
        cell.textLabel?.text = number
        cell.textLabel?.textColor = .black
        cell.backgroundColor = allBackgroudColor
        
        return cell
    }
    
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert: UIAlertController = UIAlertController(title: "Вы нажали на ячейку", message: "", preferredStyle: .alert)
        present(alert, animated: true, completion: {
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dissmisWhenTap)))
        })
    }
    
    
    //MARK: -  Actions
    @objc func dissmisWhenTap() {
        self.dismiss(animated: true)
    }
    
   
}

