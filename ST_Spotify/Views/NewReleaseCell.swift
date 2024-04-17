//
//  NewReleaseCell.swift
//  ST_Spotify
//
//  Created by Akbarshah Jumanazarov on 4/17/24.
//

import SwiftUI

struct NewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New Release"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subTitle: String? = "Single - Title"
    var add: (() -> Void)? = nil
    var play: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 150, height: 150)
                
                VStack(alignment: .leading, spacing: 5) {
                    if let title {
                        Text(title)
                            .foregroundStyle(.spotifyWhite)
                            .bold()
                    }
                    
                    if let subTitle {
                        Text(subTitle)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    
                    HStack {
                        Image(systemName: "heart")
                            .font(.title3)
                            .onTapGesture {
                                add?()
                            }
                        
                        Spacer()
                        
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                    }
                    .foregroundStyle(.white)
                }
                .font(.callout)
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .clipShape(.rect(cornerRadius: 12))
            .onTapGesture {
                play?()
            }
        }
    }
}

#Preview {
    NewReleaseCell()
}
