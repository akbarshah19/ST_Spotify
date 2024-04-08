//
//  HomeView.swift
//  ST_Spotify
//
//  Created by Akbarshah Jumanazarov on 4/8/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentUser: User? = nil
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            HStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .frame(width: 30, height: 30)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            //action
                        }
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .frame()
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUser().first
        } catch {
            print(error)
        }
    }
}

#Preview {
    HomeView()
}
