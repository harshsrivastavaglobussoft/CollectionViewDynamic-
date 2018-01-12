//
//  ViewController.swift
//  HuggingAutoLayout3
//
//  Created by Sumit Ghosh on 12/12/17.
//  Copyright © 2017 Sumit Ghosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var collectionView: UICollectionView!
    var contentArray:NSArray!
    var width:CGFloat!
    var selectedData:NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsMultipleSelection = true
        contentArray = ["Tech","Design","Humor","Travel","Music","Writing","Social Media","Life","Education","Edtech","Education Reform","Photography","Startup","Poetry","Women In Tech","FemaleFounders","Business","Fitness","Fiction","Love","Food","Sports"]
        
        self.collectionView.register(UINib(nibName:"CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                flowLayout.estimatedItemSize = CGSize(width: 1, height:1)

        }

        
    }

    @IBAction func nextButtonAction(_ sender: Any) {
        let indexPaths:NSArray = self.collectionView .indexPathsForSelectedItems! as NSArray
        for index in indexPaths {
            print(contentArray[(index as! IndexPath).row])
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! CollectionViewCell
        
        cell.textLabel.text = contentArray[indexPath.row] as? String
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 3.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    private func collectionView(collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let selectedItems = collectionView.indexPathsForSelectedItems {
            if selectedItems.contains(indexPath as IndexPath) {
                collectionView.deselectItem(at: indexPath as IndexPath, animated: true)
                return false
            }
        }
        return true
    }
    
}
