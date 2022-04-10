//
//  ScrollViewController.swift
//  IOSDoMore
//
//  Created by Avaz Mukhitdinov on 09/04/22.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       initViews()
    }


    
    // MARK: - Functions

    func initViews(){
        addNavBar()
    }
    
    func addNavBar(){
        let back = UIImage(named: "ic_back")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(leftTapped))
        title = "Scroll View"
    }
    
    // MARK: - Actions
    @objc func leftTapped(){
        navigationController?.popViewController(animated: true)
    }
}
