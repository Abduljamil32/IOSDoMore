//
//  HomeViewController.swift
//  IOSDoMore
//
//  Created by Avaz Mukhitdinov on 09/04/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var numberOfColumn: CGFloat = 2
    var items: Array<Item> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        initViews()
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumn - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        
        items.append(Item(title: "Best Coding", image: "im_notebook"))
        items.append(Item(title: "Amzing Coding", image: "im_pc"))
        items.append(Item(title: "Best Coding", image: "im_notebook"))
        items.append(Item(title: "Amzing Coding", image: "im_pc"))
        items.append(Item(title: "Best Coding", image: "im_notebook"))
        items.append(Item(title: "Amzing Coding", image: "im_pc"))
        items.append(Item(title: "Best Coding", image: "im_notebook"))
        items.append(Item(title: "Amzing Coding", image: "im_pc"))
    }


        // MARK: - Functions

    func initViews(){
        setNavBar()
    }
    
    func setNavBar(){
        title = "Collection View"
        let scroll = UIImage(named: "ic_scroll")
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(rightTapped))
    }
    
    func callScrollView(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        cell.mainLabel.text = item.title
//        cell.image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    // MARK: - Actions
    @objc func rightTapped(){
        callScrollView()
    }
     

}
