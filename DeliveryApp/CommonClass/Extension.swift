//
//  Extension.swift
//  Teeshan
//
//  Created by NITS Mac2 on 26/04/17.

//

import Foundation

class Extension
{
    
}
extension String
{
    var changePlusTo2B: String
    {
        return self.replacingOccurrences(of: "+", with: "%2B")
    }
    var removeSpecialCharsFromString: String {
        let okayChars : Set<Character> =
            Set(" 1234567890+".characters)
        return String(self.characters.filter {okayChars.contains($0) })
    }
    
    
    
}
