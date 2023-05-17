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

///  Enum of selection Option used for TagsCollection.
public enum TagSelectionOption: Int {
    
    case radio
    case checkbox
    case tags
    
    var normalImage: UIImage? {
        switch self {
        case .radio:
            if #available(iOS 13.0, *) {
                return UIImage(systemName: "circle")
            } else {
                // Fallback on earlier versions
                return UIImage(named: "circle")
            }
        case .checkbox, .tags:
            if #available(iOS 13.0, *) {
                return UIImage(systemName: "square")
            } else {
                // Fallback on earlier versions
                return UIImage(named: "square")
            }
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .radio:
            if #available(iOS 13.0, *) {
                return UIImage(systemName: "circle.inset.filled")
            } else {
                // Fallback on earlier versions
                return UIImage(named: "circle.inset.filled")
            }
        case .checkbox, .tags:
            if #available(iOS 13.0, *) {
                return UIImage(systemName: "checkmark.square.fill")
            } else {
                // Fallback on earlier versions
                return UIImage(named: "checkmark.square.fill")
            }
        }
    }
    
}
