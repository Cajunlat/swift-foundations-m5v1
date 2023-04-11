//
//  ContentView.swift
//  LearningAppV1
//
//  Created by Jamie Latiolais on 4/11/23.
//

import SwiftUI

struct ContentView: View {
    
    var module: Module
    
    var body: some View {

        ScrollView {
            
            LazyVStack (spacing: 10){
                
                ForEach (module.content.lessons) { lesson in
                    
                    NavigationLink {
                        LessonView()
                    } label: {
                        ZStack (alignment: .leading){
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                                     
                            HStack (spacing: 25) {
                                
                                Text("\(lesson.id + 1)")
                                    .bold()
                                    .font(.title2)
                                    .padding()
                                    
                                
                                VStack (alignment: .leading, spacing: 1) {
                                    
                                    Text(lesson.title)
                                        .bold()
                                        .font(.title3)
                                        
                                    Text(lesson.duration)
                                        .font(.caption)
                                }
                            }
                        }
                        .frame(height: 70)
                        .padding([.leading, .trailing])
                    }
                    .buttonStyle(PlainButtonStyle())
                          
                }
                
            }
            
        }
        .navigationTitle("Learn \(module.category)")
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = ContentModel()
        
        
        
        ContentView(module: model.modules[0])
    }
}
