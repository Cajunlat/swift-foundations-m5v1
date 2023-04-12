//
//  HomeView.swift
//  LearningAppV1
//
//  Created by Jamie Latiolais on 4/10/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                Text("What do you want to do today?")
                    .padding(.leading)
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            
                            VStack {
                                
                                NavigationLink(
                                    destination: ContentView()
                                                    .onAppear(perform: {
                                                        model.beginModule(module.id)
                                                    }),
                                   tag: module.id,
                                   selection: $model.currentContentSelected,
                                    label: {
                                        // Learning Card
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                        }).buttonStyle(PlainButtonStyle())

//                                NavigationLink(
//                                    destination: ContentView()
//                                        .onAppear(perform: {
//                                            model.beginModule(module.id)
//                                        })) {
//                                    // Learning Card
//                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
//                                }.buttonStyle(PlainButtonStyle())
                                
//                                NavigationLink(
//                                    destination: TestView()
//                                                    .onAppear(perform: {
//                                                        model.beginModule(module.id)
//                                                    }),
//                                   tag: module.id,
//                                   selection: $model.currentContentSelected,
//                                    label: {
//                                        // Quiz Card
//                                        HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
//                                        }).buttonStyle(PlainButtonStyle())
                                
                                NavigationLink(destination: TestView()) {
                                    // Quiz Card
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                                }.buttonStyle(PlainButtonStyle())
                                
                            }
                            
                        }
                        .padding()
                    }
                }
                
            }
            .navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView().environmentObject(ContentModel())
        }
    }
