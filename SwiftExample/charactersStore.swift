//
//  charactersStore.swift
//  SwiftExample
//
//  Created by 이윤정 on 4/22/26.
//

// 캐릭터 정보 담는 그릇
import SwiftUI

// 옵저버블은 클래스만 가능
@Observable
class charactersStore {
    var characters:[Characters]
    
    init (characters: [Characters] = []) {
        self.characters = characters
    }
}
