//
//  charactersStore.swift
//  SwiftExample
//
//  Created by 이윤정 on 4/22/26.
//

// 캐릭터 정보 담는 그릇
// 불러온 데이터 객체화, 모니터링, 업데이트
import SwiftUI

// 옵저버블은 클래스만 가능
// 객체를 옵저버블로 추가해서 화면이 갱신될 때 데이터 상태관리 해주는 데이터
@Observable
class charactersStore {
    var characters:[Characters]
    
    init (characters: [Characters] = []) {
        self.characters = characters
    }
}
