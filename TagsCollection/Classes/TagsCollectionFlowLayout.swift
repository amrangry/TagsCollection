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

public class TagsCollectionFlowLayout: UICollectionViewFlowLayout {
    
    typealias Alignment = (lastRow: Int, lastMargin: CGFloat)
    
    var align: TagsCollectionAlignment = .left
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        guard let attributesToReturn =  attributes.map({ $0.copy() }) as? [UICollectionViewLayoutAttributes] else { return nil }
        let shiftingFrame: ((UICollectionViewLayoutAttributes) -> Void) = { [weak self] layoutAttribute in
            guard let self = self else { return }
            if layoutAttribute.frame.origin.x + layoutAttribute.frame.size.width > collectionView.bounds.size.width {
                layoutAttribute.frame.size.width = collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right
            }
        }
        var leftMargin = sectionInset.left
        var maxY = CGFloat(-1.0)
        var alignments: [Alignment] = []
        attributesToReturn.forEach { layoutAttribute in
            switch align {
            case .left, .right:
                if layoutAttribute.frame.origin.y >= maxY {
                    alignments.append( (lastRow: layoutAttribute.indexPath.row, lastMargin: (leftMargin - minimumInteritemSpacing) ) )
                    leftMargin = sectionInset.left
                }
                shiftingFrame(layoutAttribute)
                layoutAttribute.frame.origin.x = leftMargin
                leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
                maxY = max(layoutAttribute.frame.maxY, maxY)
            case .none:
                break
            }
        }
        adjust(attributes: attributesToReturn, alignments: alignments, leftMargin: (leftMargin - minimumInteritemSpacing) )
        return attributesToReturn
    }
    
    private func adjust(attributes: [UICollectionViewLayoutAttributes], alignments: [Alignment], leftMargin: CGFloat) {
        guard let collectionView = collectionView else { return }
        switch align {
        case .right:
            attributes.forEach { layoutAttribute in
                if let data = alignments.filter({ $0.lastRow > layoutAttribute.indexPath.row }).first {
                    layoutAttribute.frame.origin.x += (collectionView.bounds.size.width - data.lastMargin - sectionInset.right)
                } else {
                    layoutAttribute.frame.origin.x += (collectionView.bounds.size.width - leftMargin - sectionInset.right)
                }
            }
        case .left, .none:
            break
        }
    }
    
}
