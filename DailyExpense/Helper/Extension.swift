//
//  Extensions.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/29/20.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1, color: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
        self.init(frame: .zero)
        
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        textColor = color
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat)  {
        self.init(image: nil)
        
        self.layer.cornerRadius = cornerRadius
        
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIView  {
    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
}

extension UIButton {
    convenience init(title: String, color: UIColor = .white, radius: Int = 0, textColor: UIColor = .black ) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = color
        self.layer.cornerRadius = CGFloat(radius)
        self.setTitleColor(textColor, for: .normal)
    }
}

extension UITextField {
    convenience init(placeholder: String, font: UIFont) {
        self.init(frame: .zero)
        self.placeholder = placeholder
        self.font = font 
        self.borderStyle = .none
    
    }
}

extension UIFont {
  var bold: UIFont {
    return with(traits: .traitBold)
  } // bold

  var italic: UIFont {
    return with(traits: .traitItalic)
  } // italic

  var boldItalic: UIFont {
    return with(traits: [.traitBold, .traitItalic])
  } // boldItalic


    func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
    guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else {
      return self
    } // guard

    return UIFont(descriptor: descriptor, size: 0)
  } // with(traits:)
} // extension

