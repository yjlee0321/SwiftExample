//
//  CharactersData.swift
//  SwiftExample
//
//  Created by 이윤정 on 4/22/26.
//

// 캐릭터 정보 불러오기 함수
// 불러온 데이터
import Foundation

var charactersData: [Characters] = loadJson("charactersData.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data : Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else { fatalError("Couldn't find \(filename)") }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename): \(error)")
    }
    do {
        let decorder = JSONDecoder()
        let result = try decorder.decode(T.self, from: data)
        return result
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
