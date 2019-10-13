//
//  MovieList.swift
//  MovieTracker
//
//  Created by zappycode on 6/18/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct MovieList : View {
    
    @ObservedObject var movieStore = MovieStore()
    @State var isPresented = false
    
    var modal: some View {
        MovieDetail(movie: Movie(), movieStore: movieStore, newMovie:true)
    }
    
    var body: some View {
        NavigationView {
            List {
                
                Button("Add Movie") {
                    self.isPresented.toggle()
                }.sheet(isPresented: $isPresented, content: {
                    self.modal
                })
                ForEach(movieStore.movies) { movie in 
                    NavigationLink(destination: MovieDetail(movie: movie, movieStore: self.movieStore, newMovie:false)) {
                        if movie.seen {
                            Text(movie.title).foregroundColor(.green)
                        } else {
                            Text(movie.title)
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct MovieList_Previews : PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
#endif
