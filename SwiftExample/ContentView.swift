//
//  ContentView.swift
//  SwiftExample
//
//  Created by 이윤정 on 4/21/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var CharactersStore = charactersStore(characters: charactersData)
    
    var body: some View {
        
        List {
            ForEach(CharactersStore.characters) { characters in
                NavigationLink(value:characters) {
//                    HStack {
//                        Image(characters.imageName)
//                            .resizable()    // 크기 조절 가능
//                            .aspectRatio(contentMode: .fit)  // 이미지의 비율을 컨텐츠에 맞춤
//                            .frame(width: 100, height: 60)
//                        Text(characters.name)
//                    }
                    ListCell(characters: characters)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ListCell: View {
    var characters: Characters
    var body: some View {
        HStack {
            Image(characters.imageName)
                .resizable()    // 크기 조절 가능
                .aspectRatio(contentMode: .fit)  // 이미지의 비율을 컨텐츠에 맞춤
                .frame(width: 100, height: 60)
            Text(characters.name)
        }
    }
}
