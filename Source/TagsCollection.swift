//  MIT License
//
//  Copyright (c) 2023 AmrAngry. All rights reserved. (https://twitter.com/amr_elghadban)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

public protocol TagsCollectionDelegate: AnyObject {
    
    func didReachedSelectionLimit( _ selectionView: TagsCollection)
    func didSelectItem(at indexPath: IndexPath, object: TagsCollectionBindableModel?, collection: TagsCollection)
    func didUnselectItem(at indexPath: IndexPath, object: TagsCollectionBindableModel?, collection: TagsCollection)
    //    func didSelectItem(at indexPath: IndexPath, collection: TagsCollection?) {
    //        self.updateSelection(self.items[indexPath.row])
    //    }
}

public class TagsCollection: UIView {

    // MARK: - Variables
    public weak var delegate: TagsCollectionDelegate?

    public var didReachedSelectionLimit: (( _ selectionView: TagsCollection) -> Void)?
    public var didSelectItem: ((_ at: IndexPath, _ object: TagsCollectionBindableModel?, _ collection: TagsCollection) -> Void)?
    public var didUnselectItem: ((_ at: IndexPath, _ object: TagsCollectionBindableModel?, _ collection: TagsCollection) -> Void)?
    
    private var resource: (cell: TagCollectionCell?, identifier: String)?
    public var cellDesignAttributes = TagsCollectionCellUIDesignAttributes()
    public lazy var tagLayout = TagsCollectionFlowLayout()
    public var maxSelectCount: Int?
    public var options: TagsCollectionUILayoutAttributes = TagsCollectionUILayoutAttributes() {
        didSet {
            tagLayout.sectionInset = options.sectionInset
            tagLayout.minimumInteritemSpacing = options.interItemSpacing
            tagLayout.minimumLineSpacing = options.lineSpacing
            tagLayout.scrollDirection = options.scrollDirection
            if selectionOption == .tags && options.scrollDirection != .horizontal {
                tagLayout.align = alignment == .right ? .right: .left
            } else {
                tagLayout.align = .none
            }
            collectionView.collectionViewLayout = tagLayout
            collectionView.reloadData()
        }
    }
    
    public var alignment: TagsCollectionAlignment? = .left {
        didSet {
            if selectionOption == .tags && options.scrollDirection != .horizontal {
                tagLayout.align = alignment == .right ? .right: .left
            } else {
                tagLayout.align = .none
            }
            collectionView.reloadData()
        }
    }
    
    public var selectionOption: TagSelectionOption? {
        didSet {
            if selectionOption == .tags && options.scrollDirection != .horizontal {
                tagLayout.align = alignment == .right ? .right: .left
            } else {
                tagLayout.align = .none
            }
            collectionView.collectionViewLayout = tagLayout
            items.forEach { $0.selectionOption = (selectionOption ?? .tags) }
            collectionView.reloadData()
        }
    }
    
    public override var backgroundColor: UIColor? {
        didSet {
            collectionView.backgroundColor = backgroundColor
        }
    }
    
    fileprivate lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.bounces = false
        view.translatesAutoresizingMaskIntoConstraints = false
        let reuseIdentifier = String(describing: TagCollectionCell.self)
        //view.register(UINib.init(nibName: reuseIdentifier, bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
        view.register(TagCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        return view
    }()
    
    public var items: [TagsCollectionBindableModel] = [] {
        didSet {
            items.forEach { $0.selectionOption = (selectionOption ?? .tags) }
            collectionView.reloadData()
            layoutIfNeeded()
        }
    }
    
    var selectedItems: [TagsCollectionBindableModel]? {
        items.filter { $0.isSelected == true }
    }
    
    var selectedModels: [Any]? {
        selectedItems?.compactMap { $0.originModel }
    }
    
    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addViews()
      //  fatalError("init?(coder: NSCoder) not implemented yet")
    }
    
    fileprivate func addViews() {
        setupCollectionView()
    }
    
    // MARK: - Hepler Methods
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        resource = (cell: TagCollectionCell(), String(describing: TagCollectionCell.self))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: topAnchor),
                                     collectionView.leftAnchor.constraint(equalTo: leftAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     collectionView.rightAnchor.constraint(equalTo: rightAnchor)])
    }
    
    fileprivate func updateSelection(_ selectItem: TagsCollectionBindableModel) {
        let status = selectItem.isSelected
        if selectionOption == .radio {
            items.filter { $0.isSelected == true }.forEach { ($0).isSelected = false }
            selectItem.isSelected = !status
            collectionView.reloadData()
        } else {
            if let maxCount = maxSelectCount, !selectItem.isSelected {
                let count = items.filter { $0.isSelected == true }.count
                if count < maxCount {
                    selectItem.isSelected.toggle()
                    collectionView.reloadData()
                } else {
                    delegate?.didReachedSelectionLimit(self)
                    didReachedSelectionLimit?(self)
                }
            } else {
                selectItem.isSelected.toggle()
                collectionView.reloadData()
            }
        }
    }
    
}

// MARK: - UICollectionView Delegate & DataSource
extension TagsCollection: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = String(describing: TagCollectionCell.self)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TagCollectionCell else {
            return UICollectionViewCell()
        }
        let item = items[indexPath.row]
        cell.delegate = self
        cell.alignment = alignment ?? .left
        cell.configCell(item, designAttributes: cellDesignAttributes)
        cell.layoutIfNeeded()
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectItem = items[indexPath.row]
        let status = selectItem.isSelected
        if status == true {
            delegate?.didUnselectItem(at: indexPath, object: selectItem, collection: self)
            didUnselectItem?(indexPath, selectItem, self)
        } else {
            delegate?.didSelectItem(at: indexPath, object: selectItem, collection: self)
            didSelectItem?(indexPath, selectItem, self)
        }
        updateSelection(selectItem)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TagsCollection: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if selectionOption == .tags {
            guard let cell = resource?.cell else { return .zero }
            let item = items[indexPath.row]
            cell.configCell(item, designAttributes: cellDesignAttributes)
            let size = cell.fittingSize
            let cellSize = CGSize(width: size.width, height: cellDesignAttributes.rowHeight)
            return cellSize
        } else {
            if options.scrollDirection == .horizontal {
                let cellSize = CGSize(width: items[indexPath.row].width, height: cellDesignAttributes.rowHeight)
                return cellSize
            } else {
                let cellSize = CGSize(width: frame.width, height: cellDesignAttributes.rowHeight)
                return cellSize
            }
        }
    }
    
}

// MARK: - TagCollectionCellDelegate
extension TagsCollection: TagCollectionCellDelegate {
    
    public func selectionAction(_ selectItem: TagsCollectionBindableModel) {
        updateSelection(selectItem)
    }
    
}
