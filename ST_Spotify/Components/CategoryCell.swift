//
//  CategoryCell.swift
//  ST_Spotify
//
//  Created by Akbarshah Jumanazarov on 4/8/24.
//

import SwiftUI

struct CategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .font(.callout)
            .frame(minWidth: 65)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        CategoryCell()
    }
}
