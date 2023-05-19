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

class TagCollectionCell: UICollectionViewCell {
    
    // MARK: - IBOutLet
    fileprivate let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        return stackView
    }()
    
    fileprivate let selectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        return button
    }()
    
    fileprivate var titleLabel: UILabel = {
        let label             = UILabel(frame: CGRect())
        label.textAlignment   = .left
        label.textColor       = .black
        label.font            =  UIFont.systemFont(ofSize: 15)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Variables UI
    var alignment: TagsCollectionAlignment = TagsCollectionAlignment.left {
        didSet {
            selectButton.removeFromSuperview()
            titleLabel.removeFromSuperview()
            if alignment == .right {
                stackView.addArrangedSubview(titleLabel)
                stackView.addArrangedSubview(selectButton)
            } else {
                stackView.addArrangedSubview(selectButton)
                stackView.addArrangedSubview(titleLabel)
            }
            stackView.setNeedsDisplay()
            stackView.layoutIfNeeded()
        }
    }
    
    var fittingSize: CGSize {
        return self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
    // MARK: - Variables
    fileprivate var bindableObject: TagsCollectionBindableModel?
    weak var delegate: TagCollectionCellDelegate?
    
    // MARK: - Init Variables
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented")
    }
    
    // MARK: - Helper
    fileprivate func addViews() {
        selectButton.removeFromSuperview()
        titleLabel.removeFromSuperview()
        
        addSubview(stackView)
        
        stackView.backgroundColor = .clear
        stackView.addArrangedSubview(selectButton)
        stackView.addArrangedSubview(titleLabel)
        
        selectButton.addTarget(self, action: #selector(selectButtonAction(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([selectButton.heightAnchor.constraint(equalToConstant: 25),
                                     selectButton.widthAnchor.constraint(equalToConstant: 25)])
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                                     stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
                                     stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
                                     stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)])
    }
    
    // MARK: - UIButton Action
    @objc func selectButtonAction(_ button: UIButton) {
        delegate?.selectionAction(bindableObject!)
    }
    
    // MARK: - Config Cell
    public func configCell(_ item: TagsCollectionBindableModel?, designAttributes: TagsCollectionCellUIDesignAttributes? = TagsCollectionCellUIDesignAttributes(), alignment: TagsCollectionAlignment = TagsCollectionAlignment.left) {
        if let object = item, let options = designAttributes {
            bindableObject = item
            
            titleLabel.text = object.title
            titleLabel.textColor = object.isSelected ? options.selectedTitleColor : options.titleColor
            
            backgroundColor = object.isSelected ? options.selectedCellBackgroundColor : options.cellBackgroundColor
            layer.borderColor = object.isSelected ? options.selectedCellBorderBackgroundColor.cgColor : options.cellBorderBackgroundColor.cgColor
            layer.borderWidth = options.borderWidth
            //stackView.layer.borderColor = UIColor.yellow.cgColor
            layer.cornerRadius = options.cornerRadius
            
            selectButton.isHidden = !options.isShowButton
            selectButton.isSelected = object.isSelected
            let isSelected = object.isSelected
            let image = isSelected ? object.selectionOption.selectedImage : object.selectionOption.normalImage
            let tintedImage = image?.withRenderingMode(.alwaysTemplate)
            let buttonTintColor = isSelected ? options.selectedButtonColor : options.buttonColor
            selectButton.setImage(tintedImage, for: isSelected ? .selected: .normal)
            selectButton.tintColor = buttonTintColor
        }
    }
    
}
