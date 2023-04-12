//
//  ContentView.swift
//  LearningAppV1
//
//  Created by Jamie Latiolais on 4/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {

        ScrollView {
            
            LazyVStack (spacing: 10){
                
                if model.currentModule != nil {
                    
                    ForEach (0..<model.currentModule!.content.lessons.count, id: \.self) { index in
                        
                        NavigationLink {
                            ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                })
                        } label: {
                            ContentViewRow(index: index)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
                
            }
            
        }
        .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
    
        ContentView()
            .environmentObject(ContentModel())

    }
}
