//
//  HomeView.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 9/4/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Courses")
                    .customFont(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 20) {
                        
                        ForEach(courses) { course in
                            
                            VerticalCard(course: course)
                        }
                    }.padding()
                        .padding(.bottom, 10)
                }
                
                Text("Recent")
                    .customFont(.title3)
                    .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(courseSections) { section in
                        
                        HorizontalCard(section: section)
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
