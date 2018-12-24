//
//  RandomNumber.swift
//  Teeshan
//
//  Created by NITS Mac2 on 26/04/17.
//  Copyright © 2017 NITS Mac2. All rights reserved.
//

import Foundation

class RandomNumber
{
    static func randomNumber() -> Int
    {
        let MAX : UInt32 = 9999
        let MIN : UInt32 = 1000
        let result: UInt32 = arc4random_uniform(MAX) + MIN
        let random_number =  result > MAX ? result - MIN : result
        print ("random = ", random_number);
        return Int(random_number)
    }
}
