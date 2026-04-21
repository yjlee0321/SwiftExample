//
//  Characters.swift
//  SwiftExample
//
//  Created by 이윤정 on 4/22/26.
//

import Foundation

struct Characters: Codable, Identifiable {
    var id : String
    var name : String
    var description : String
    var imageName : String
    var isBear : Bool
}
