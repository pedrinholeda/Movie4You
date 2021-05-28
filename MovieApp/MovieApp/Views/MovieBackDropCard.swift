//
//  MovieBackDropCard.swift
//  MovieApp
//
//  Created by Pedro Henrique on 28/05/21.
//

import SwiftUI

struct MovieBackDropCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack{
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            Text(movie.title)
        }
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}

struct MovieBackDropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackDropCard(movie: Movie.stubbedMovie)
    }
}
