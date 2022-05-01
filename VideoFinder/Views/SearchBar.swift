//
//  SearchBar.swift
//  VideoFinder
//
//  Created by Kirill Borichevskiy on 28/04/2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false

    var body: some View {

        HStack {

            TextField("Search...", text: $text)
                    .padding(10)
                    .foregroundColor(.gray)
                    .accentColor(Color("AccentOrange"))
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal, 20)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .font(.caption)
                    .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                        .foregroundColor(.orange)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 8)

                                if isEditing {
                                    Button(action: {
                                        self.text = ""
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                                .foregroundColor(.orange)
                                                .padding(.trailing, 8)
                                    }
                                }
                            }
                    )
                    .padding(.horizontal, 30)
                    .onTapGesture {
                        self.isEditing = true
                    }

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                }) {
                    Text("Cancel")
                            .foregroundColor(Color("AccentOrange"))
                }
                        .padding(.trailing, 20)
                        .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
