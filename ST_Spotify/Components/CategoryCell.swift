//
//  CategoryCell.swift
//  ST_Spotify
//
//  Created by Akbarshah Jumanazarov on 4/8/24.
//

import SwiftUI

struct CategoryCell: View {
    
    var title: String
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        CategoryCell(title: "Button")
    }
}
