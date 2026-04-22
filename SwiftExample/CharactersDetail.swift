//
//  CharactersDetail.swift
//  SwiftExample
//
//  Created by 이윤정 on 4/22/26.
//

import SwiftUI

struct CharactersDetail: View {
    let selectedCharacter: Characters
    var body: some View {
        Form {
            Section(header : Text("Character Details")) {
                Image(selectedCharacter.imageName)
                    .resizable()
                    // .cornerRadius(12.0)의 최신코드 업데이트
                    .clipShape(.rect(cornerRadius: 12))
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCharacter.name)
                    .font(.headline)
                
                Text(selectedCharacter.description)
                    .font(.body)
                
                HStack {
                    Text("Bear").font(.headline)
                    Spacer()
                    Image(systemName: selectedCharacter.isBear ?
                          "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

#Preview {
    CharactersDetail(selectedCharacter: charactersData[0])
}
