//
//  ContentViewRow.swift
//  LearningAppV1
//
//  Created by Jamie Latiolais on 4/11/23.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        ZStack (alignment: .leading){
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            HStack (spacing: 25) {
                
                Text(String(lesson.id + 1))
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
}

//struct ContentViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        ContentViewRow(index: 1).environmentObject(ContentModel)
//    }
//}
