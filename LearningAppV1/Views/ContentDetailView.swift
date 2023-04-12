//
//  ContentDetailView.swift
//  LearningAppV1
//
//  Created by Jamie Latiolais on 4/11/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            // MARK: VideoPlayer -- Only show video if valid url
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // MARK: Description
            CodeTextView()
              
            // MARK: Next Lesson Button -- only show if there is a next lesson
            if model.hasNextLesson() {
                Button {
                    // Advance the lesson
                    model.nextLesson()
                } label: {

                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
     
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
            else {
                Button {
                    // Go back to home screen
                    model.currentContentSelected = nil
                } label: {
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
        }
        .padding()
        .navigationTitle(lesson?.title ?? "")
    }
}

//struct ContentDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentDetailView()
//    }
//}
