//
//  AddNewCharacter.swift
//  SwiftExample
//
//  Created by 이윤정 on 4/23/26.
//

import SwiftUI

struct AddNewCharacter: View {
    
    @State var CharactersStore = charactersStore()
    @State private var isBear: Bool = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form{
            Section(header: Text("Character Details")) {
                Image(systemName: "person.fill")
                    .resizable()    // 1:1비율
                    .aspectRatio(4/3,contentMode: .fit) // 비율 조정
                
                    .padding()
                
                DataInput(title: "Character", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                Toggle(isOn: $isBear) {
                    Text("Bear").font(.headline)
                }
                .padding()
            }
            
            Button(action: AddNewCharacter) {
                Text("Add Character")
            }
        }
    }
    
    func AddNewCharacter() {
        let newCharacter = Characters(id: UUID().uuidString,
                                     name: name,
                                     description: description,
                                     imageName: "Chairoi Coguma",
                                     isBear: isBear)
        CharactersStore.characters.append(newCharacter)
        
    }
}

#Preview {
    AddNewCharacter()
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
