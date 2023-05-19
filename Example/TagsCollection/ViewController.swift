//
//  ViewController.swift
//  TagsCollection
//
//  Created by amrangry on 05/18/2023.
//  Copyright (c) 2023 amrangry. All rights reserved.
//

import UIKit
import TagsCollection

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tagsContainer: UIView?
    fileprivate var tagsCollection: TagsCollection?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configClassification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Design Layout
    fileprivate func configClassification() {
        tagsCollection = TagsCollection()//(frame: CGRect.zero)
        tagsCollection?.selectionOption = .tags
        tagsCollection?.delegate = self
        tagsCollection?.alignment = .right // .left
        tagsCollection?.backgroundColor = .clear
        //tagsCollection?.maxSelectCount = 5
        tagsContainer?.addSubview(self.tagsCollection!)
        
        self.tagsCollection?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagsCollection!.topAnchor.constraint(equalTo: tagsContainer!.topAnchor),
            tagsCollection!.bottomAnchor.constraint(equalTo: tagsContainer!.bottomAnchor),
            tagsCollection!.leftAnchor.constraint(equalTo: tagsContainer!.leftAnchor),
            tagsCollection!.rightAnchor.constraint(equalTo: tagsContainer!.rightAnchor)
        ])
        tagsContainer?.layoutIfNeeded()
        
        var appearanceAttribute = TagsCollectionCellUIDesignAttributes()
        appearanceAttribute.cellBackgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        appearanceAttribute.selectedTitleColor = .green
        appearanceAttribute.selectedCellBackgroundColor = UIColor(red: 237, green: 28, blue: 36, alpha: 0.1)
        appearanceAttribute.selectedCellBorderBackgroundColor = .black
        //appearanceAttribute.selectedButtonColor = .white
        appearanceAttribute.isShowButton = false
        appearanceAttribute.borderWidth = 1
        appearanceAttribute.rowHeight = 40
        appearanceAttribute.cornerRadius = 20
        
        tagsCollection?.backgroundColor = .clear
        tagsCollection?.cellDesignAttributes = appearanceAttribute
        tagsCollection?.options = TagsCollectionUILayoutAttributes(sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), lineSpacing: 10, interItemSpacing: 10, scrollDirection: .vertical) //swiftlint:disable:this line_length
        
        setDatasource()
    }
    
    func setDatasource() {
        var items = [TagsCollectionBindableModel]()
        let categories = [Category(id: 1, name: ""),
                          Category(id: 1, name: ""),
                          Category(id: 1, name: ""),
                          Category(id: 1, name: ""),
                          Category(id: 1, name: "")]
        for category in categories {
            guard let name = category.name else { continue }
            items.append(TagsCollectionBindableModel(title: name, originModel: category))
        }
        
        let width = UIScreen.main.bounds.size.width
        //        let height = UIScreen.main.bounds.size.height
        let chunkedItems = items.chunked(into: Int((self.tagsCollection?.frame.height)! / (self.tagsCollection?.cellDesignAttributes.rowHeight)!))
        for item in chunkedItems {
            let maxHeight = (item.map { $0.width }.max() ?? width/2) + TagCollectionCell.cellExtraSpace
            item.forEach {$0.width = maxHeight }
        }
        
        DispatchQueue.main.async {
            self.tagsCollection?.items = items
        }
    }
}

// MARK: - ARSelectionView Delegate
extension ViewController: TagsCollectionDelegate {
    
    func selectionMaxLimitReached(_ selectionView: TagsCollection) {
        
    }
    
    func didSelectItemAt(didSelectItemAt indexPath: IndexPath, object: TagsCollectionBindableModel?, collection: TagsCollection) {
        
    }
    
    func didUnselectItemAt(didSelectItemAt indexPath: IndexPath, object: TagsCollectionBindableModel?, collection: TagsCollection) {
        
    }

}

// MARK: - Category
struct Category {
    let id: Int?
    let name: String?
}
