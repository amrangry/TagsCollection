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

/// TagsCollectionCellUIDesignAttributes for cell
public struct TagsCollectionCellUIDesignAttributes {
    
    /// Initializer
    public init() {}
    
    /// rowHeight
    public var rowHeight: CGFloat = 35
    
    /// isShowButton
    public var isShowButton: Bool = true
    
    /// cornerRadius
    public var cornerRadius: CGFloat = 0
    
    /// borderWidth
    public var borderWidth: CGFloat = 0
    
    /// buttonColor
    public var buttonColor: UIColor = .black
    
    /// titleColor
    public var titleColor: UIColor = .black
    
    /// cellBackgroundColor
    public var cellBackgroundColor: UIColor = .white
    
    /// cellBorderBackgroundColor
    public var cellBorderBackgroundColor: UIColor = .clear
    
    /// selectedButtonColor
    public var selectedButtonColor: UIColor = .black
    
    /// selectedTitleColor
    public var selectedTitleColor: UIColor = .black
    
    /// selectedCellBackgroundColor
    public var selectedCellBackgroundColor: UIColor = .white
    
    /// selectedCellBorderBackgroundColor
    public var selectedCellBorderBackgroundColor: UIColor = .white
    
}
