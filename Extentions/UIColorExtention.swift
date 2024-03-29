
extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
    
    func fromHexString(hexString: String, alpha:CGFloat = 1.0) -> UIColor {        
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    func invert() -> UIColor {
        var red:CGFloat  =   255.0
        var green:CGFloat  =   255.0
        var blue:CGFloat  =   255.0
        var alpha:CGFloat  =   1.0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        red     =   255.0 - (red * 255.0)
        green   =   255.0 - (green * 255.0)
        blue    =   255.0 - (blue * 255.0)
        
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    public func adjust(hueBy hue: CGFloat = 0, saturationBy saturation: CGFloat = 0, brightnessBy brightness: CGFloat = 0) -> UIColor {        
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0
        
        if getHue(&currentHue, saturation: &currentSaturation, brightness: &currentBrigthness, alpha: &currentAlpha) {
            return UIColor(hue: currentHue + hue,
                           saturation: currentSaturation + saturation,
                           brightness: currentBrigthness + brightness,
                           alpha: currentAlpha)
        } else {
            return self
        }
    }

    func toRGBAColor() -> [String: CGFloat]
    {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let dict : [String: CGFloat] = ["R": red, "G":green, "B":blue, "A":alpha]
        return dict
    }
    
    static func fromRGBAColor(color: [String: CGFloat]) -> UIColor {
        if color.isEmpty {
            return UIColor.white
        }
        let dColor : UIColor = UIColor(displayP3Red: color["R"] ?? 0,
                                       green: color["G"] ?? 0,
                                       blue: color["B"] ?? 0,
                                       alpha: color["A"] ?? 0)
        return dColor
    } 
}