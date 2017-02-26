//
//  UIImageViewExtension.swift
//  Summerize
//
//  Created by Paul-Anatole CLAUDOT on 08/02/2017.
//  Copyright © 2017 Summerize. All rights reserved.
//

import UIKit

extension UIImageView {
    
    open func setImage(string: String?) {
        setImage(string: string, color: nil, circular: false, textAttributes: nil)
    }
    
    open func setImage(string: String?, color: UIColor?) {
        setImage(string: string, color: color, circular: false, textAttributes: nil)
    }
    
    open func setImage(string: String?, color: UIColor?, circular: Bool) {
        setImage(string: string, color: color, circular: circular, textAttributes: nil)
    }
    
    open func setImage(string: String?, color: UIColor?, circular: Bool, textAttributes: [String : Any]?) {
        var displayString = ""
        if let s = string {
            displayString = s.shortString()
        }
        var image:UIImage?
        if let c = color {
            image = self.imageSnap(text: displayString as String, color: c, circular: circular, textAttributes:textAttributes)
        }
        else {
            image = self.imageSnap(text: displayString as String, color: UIColor.randomColor(), circular: circular, textAttributes: textAttributes)
        }
        if let i = image {
            self.image = i
        }
    }
    
    private func imageSnap(text: String?, color: UIColor, circular: Bool, textAttributes: [String : Any]?) -> UIImage? {
        let scale:Float = Float(UIScreen.main.scale)
        var size:CGSize = self.bounds.size
        if (contentMode == .scaleToFill || contentMode == .scaleAspectFill || contentMode == .scaleAspectFit || contentMode == .redraw) {
            size.width = CGFloat(floorf((Float(size.width) * scale) / scale))
            size.height = CGFloat(floorf((Float(size.height) * scale) / scale))
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, CGFloat(scale))
        let context = UIGraphicsGetCurrentContext()
        if circular {
            let path = CGPath(ellipseIn: self.bounds, transform: nil)
            context!.addPath(path)
            context?.clip()
        }
        
        // Fill
        context!.setFillColor(color.cgColor)
        context!.fill(CGRect(x:0, y:0, width:size.width, height:size.height))
        
        // Text
        if let t = text {
            var ta = textAttributes
            if ta == nil {
                ta = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName : UIFont.systemFont(ofSize: 15.0)]
            }
            let textSize:CGSize = t.size(attributes: ta)
            let bounds:CGRect = self.bounds
            t.draw(in: CGRect(x:bounds.size.width/2 - textSize.width/2, y:bounds.size.height/2 - textSize.height/2, width:textSize.width, height:textSize.height), withAttributes: ta)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
        
    }
}

// MARK: UIColor Helper
extension UIColor {
    open class func randomColor() -> UIColor {
        srandom(arc4random())
        var red:Float = 0.0
        while (red < 0.1 || red > 0.84) {
            red = Float(drand48())
        }
        var green:Float = 0.0
        while (green < 0.1 || green > 0.84) {
            green = Float(drand48())
        }
        var blue:Float = 0.0
        while (blue < 0.1 || blue > 0.84) {
            blue = Float(drand48())
        }
        return UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    open class func colorHash(name: String?) -> UIColor {
        if let n = name {
            var nameValue = 0
            for c in n.characters {
                let characterString = String(c)
                let scalars = characterString.unicodeScalars
                nameValue +=  Int(scalars[scalars.startIndex].value)
            }
            var r = Float((nameValue * 123) % 51) / 51.0
            var g = Float((nameValue * 321) % 73) / 73.0
            var b = Float((nameValue * 213) % 91) / 91.0
            r = min(max(r, 0.1), 0.84)
            g = min(max(g, 0.1), 0.84)
            b = min(max(b, 0.1), 0.84)
            
            return UIColor.init(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
        }
        else {
            return UIColor.red
        }
    }
}

// MARK: String Helper
extension String {
    func shortString() -> String {
        let displayString = NSMutableString.init()
            var words = components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
            
            if words.count > 0 {
                let firstWord = words[0]
                if firstWord.characters.count > 0 {
                    let index = firstWord.index(firstWord.startIndex, offsetBy: 1)
                    displayString.append(firstWord.substring(to: index))
                }
                if words.count > 1 {
                    var lastWord = words.last
                    while lastWord?.characters.count == 0 && words.count > 1 {
                        words.removeLast()
                        lastWord = words.last
                    }
                    
                    if words.count > 1 {
                        if let last = lastWord {
                            if last.characters.count > 0 {
                                let index = last.index(last.startIndex, offsetBy: 1)
                                displayString.append(last.substring(to: index))
                            }
                        }
                    }
                }
            }
        return displayString.uppercased as String
    }
}
