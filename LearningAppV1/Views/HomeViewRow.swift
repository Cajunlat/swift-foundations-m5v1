//
//  HomeViewRow.swift
//  LearningAppV1
//
//  Created by Jamie Latiolais on 4/10/23.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                
            HStack {
                
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack (alignment: .leading, spacing: 10){
                    Text(title)
                        .bold()
                        .font(.system(size: 20))

                    Text(description)
                        .font(.system(size: 14))
                        .padding(.bottom, 10)
                    

                    
                    HStack {
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(.system(size: 10))
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(.system(size: 10))
                    }

                }
                .padding(.leading)

            }
            .padding(.horizontal, 20)
            
        }

        
    }
}

//struct HomeViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//
////        let test = ContentModel()
//
////        let image = test.modules[1].content.image
////        let title = "Learn \(test.modules[1].category)"
////        let description = test.modules[1].content.description
////        let amount = "\(test.modules[1].content.lessons.count) Lessons"
////        let time = test.modules[1].content.time
//
//        let image = "swift"
//        let title = "title"
//        let description = "description"
//        let amount = "20 Lessons"
//        let time = "2 hours"
//
//        HomeViewRow(image: image, title: title, description: description, count: amount, time: time)
//    }
//}
