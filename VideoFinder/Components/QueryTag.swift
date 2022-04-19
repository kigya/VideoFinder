//
//  QueryTag.swift
//  VideoFinder
//
//  Created by Kirill Borichevskiy on 19/04/2022.
//

import SwiftUI

struct QueryTag: View {
    var query: Query
    var isSelected: Bool

    var body: some View {
        Text(query.rawValue)
                .font(.caption)
                .bold()
                .foregroundColor(isSelected ? .white : .white)
                .padding(10)
                .background(isSelected ? Color("AccentOrange") : .gray)
                .cornerRadius(10)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: Query.food, isSelected: true)
    }
}
