//
//  SampleViewControllerUsingInterfaceBuilder.swift
//  TagsCollection_Example
//
//  Created by Amr Elghadban on 19/05/2023.
//  Copyright © 2023 amrangry. All rights reserved.
//

import UIKit
import TagsCollection

class SampleViewControllerUsingInterfaceBuilder: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tagsCollection: TagsCollection?
    
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
        tagsCollection?.selectionOption = .tags
        tagsCollection?.delegate = self
        tagsCollection?.alignment = .right // .left
        tagsCollection?.backgroundColor = .clear
        //tagsCollection?.maxSelectCount = 5
        
        var appearanceAttribute = TagsCollectionCellUIDesignAttributes()
        appearanceAttribute.titleColor = .black
        appearanceAttribute.cellBackgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        appearanceAttribute.selectedTitleColor = .white
        appearanceAttribute.selectedCellBackgroundColor = .blue
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
        let categories = [Category(id: 1, name: "UI|UX"),
                          Category(id: 2, name: "Web"),
                          Category(id: 3, name: "Web design"),
                          Category(id: 4, name: "Design"),
                          Category(id: 5, name: "Web kit"),
                          Category(id: 6, name: "UI design"),
                          Category(id: 7, name: "This is a long tag"),
                          Category(id: 8, name: "iOS"),
                          Category(id: 9, name: "Android"),
                          Category(id: 10, name: "Product management"),
                          Category(id: 11, name: "Front-end development"),
                          Category(id: 12, name: "Data analysis"),
                          Category(id: 13, name: "User research"),
                          Category(id: 14, name: "Information architecture"),
                          Category(id: 15, name: "Backend engineering"),
                          Category(id: 16, name: "Digital marketing"),
                          Category(id: 17, name: "Mobile app development"),
                          Category(id: 18, name: "Game design"),
                          Category(id: 19, name: "E-commerce"),
                          Category(id: 20, name: "Artificial intelligence"),
                          Category(id: 21, name: "Cloud computing"),
                          Category(id: 22, name: "Cybersecurity"),
                          Category(id: 23, name: "Machine learning"),
                          Category(id: 24, name: "Big data"),
                          Category(id: 25, name: "Data visualization"),
                          Category(id: 26, name: "Augmented reality"),
                          Category(id: 27, name: "Virtual reality"),
                          Category(id: 28, name: "Blockchain"),
                          Category(id: 29, name: "Internet of Things"),
                          Category(id: 30, name: "Digital transformation"),
                          Category(id: 31, name: "Software engineering"),
                          Category(id: 32, name: "Quality assurance"),
                          Category(id: 33, name: "Project management"),
                          Category(id: 34, name: "Agile methodology"),
                          Category(id: 35, name: "DevOps"),
                          Category(id: 36, name: "Responsive design"),
                          Category(id: 37, name: "User interface"),
                          Category(id: 38, name: "User experience"),
                          Category(id: 39, name: "Mobile design"),
                          Category(id: 40, name: "UI|UX"),
                          Category(id: 41, name: "Web"),
                          Category(id: 42, name: "Web design"),
                          Category(id: 43, name: "Design"),
                          Category(id: 44, name: "Web kit"),
                          Category(id: 45, name: "UI design"),
                          Category(id: 46, name: "This is a long tag"),
                          Category(id: 47, name: "iOS"),
                          Category(id: 48, name: "Android"),
                          Category(id: 49, name: "Graphic design"),
                          Category(id: 50, name: "Front-end development")]
        for category in categories {
            guard let name = category.name else { continue }
            items.append(TagsCollectionBindableModel(title: name, originModel: category))
        }
        
        let width = UIScreen.main.bounds.size.width
        let collectionHeight = (self.tagsCollection?.frame.height) ?? 1 // UIScreen.main.bounds.size.height
        let estimateCellHeight = (self.tagsCollection?.cellDesignAttributes.rowHeight) ?? 1
        let chunkedItems = items.chunked(into: Int( collectionHeight / estimateCellHeight) )
        for item in chunkedItems {
            let maxHeight = (item.map { $0.width }.max() ?? width/2) + TagCollectionCell.cellExtraSpace
            item.forEach {$0.width = maxHeight }
        }
        
        DispatchQueue.main.async {
            self.tagsCollection?.items = items
        }
    }
}

// MARK: - TagsCollection Delegate
extension SampleViewControllerUsingInterfaceBuilder: TagsCollectionDelegate {
    
    func selectionMaxLimitReached(_ selectionView: TagsCollection) {
        
    }
    
    func didSelectItemAt(didSelectItemAt indexPath: IndexPath, object: TagsCollectionBindableModel?, collection: TagsCollection) {
        
    }
    
    func didUnselectItemAt(didSelectItemAt indexPath: IndexPath, object: TagsCollectionBindableModel?, collection: TagsCollection) {
        
    }
    
}
