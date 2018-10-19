//
//  UIColor+Assets.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

extension UIColor {
    
    @nonobjc class var inAppButtonColor: UIColor {
        return UIColor(named: "ButtonBackgroundColor")!
        //return UIColor(red: 0/255, green: 149/255, blue: 255/255, alpha: 0.5)
    }
    
    @nonobjc class var signInButtonColor: UIColor {
        return UIColor(named: "SignInButtonBackgroundColor")!

        //return UIColor(red: 0/255, green: 149/255, blue: 255/255, alpha: 0.5)
    }
    
    @nonobjc class var buttonDisabled: UIColor {
        return UIColor(named: "ButtonDisabledText")!
        //return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
    }
    
    @nonobjc class var buttonEnabled: UIColor {
        return UIColor(named: "ButtonEnabledText")!
        //return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
    }
    

    
}
