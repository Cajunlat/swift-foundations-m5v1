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
        
        NavigationStack (path: $model.path) {
            
            VStack (alignment: .leading) {
                
                Text("What do you want to do today?")
                    .padding(.leading)
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            
                            VStack {
                                
                                // passes an Int into the Navigation Destination ==> lesson
                                NavigationLink(value: module.id) {
                                    // Learning Card
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                }.buttonStyle(PlainButtonStyle())
                                
                                // passes the Model into the Navigation Destination ==> test
                                NavigationLink(value: module ) {
                                    // Quiz Card
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                                }.buttonStyle(PlainButtonStyle())
                                
               
//                                NavigationLink(destination: TestView()) {
//                                    // Quiz Card
//                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
//                                }.buttonStyle(PlainButtonStyle())
                                
                            }
                            
                        }
                        .padding()
                    }
                }
                
            }
            // use int and pass in module to function for learning modules
            .navigationDestination(for: Int.self, destination: { content in
                ContentView()
                    .onAppear {
                        model.beginModule(content)
                    }
            })
            // Use Module and pass in module.id for test
            .navigationDestination(for: Module.self , destination: { test in
                TestView()
            })
            .navigationTitle("Get Started")
        }
        
    }
}
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView().environmentObject(ContentModel())
        }
    }
