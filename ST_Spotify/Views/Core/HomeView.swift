//
//  HomeView.swift
//  ST_Spotify
//
//  Created by Akbarshah Jumanazarov on 4/8/24.
//

import SwiftUI
import SwiftfulUI

struct HomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        RecentsSection()
                        
                    } header: {
                        Header()
                    }
                }
                .padding(.top)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    @ViewBuilder private func Header() -> some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            //action
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryCell(title: category.rawValue.capitalized,
                                     isSelected: selectedCategory == category)
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(Color.spotifyBlack)
    }
    
    @ViewBuilder private func RecentsSection() -> some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                RecentsCell(title: product.title,
                            imageName: product.firstImage)
            }
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUser().first
            products = try await Array(DatabaseHelper().getProduct().prefix(8))
        } catch {
            print(error)
        }
    }
}

#Preview {
    HomeView()
}
