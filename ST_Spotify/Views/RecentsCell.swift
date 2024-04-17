//
//  RecentsCell.swift
//  ST_Spotify
//
//  Created by Akbarshah Jumanazarov on 4/17/24.
//

import SwiftUI
import SwiftfulUI

struct RecentsCell: View {
    
    var title: String = "Some Title"
    var imageName: String = Constants.randomImage
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    RecentsCell()
}
