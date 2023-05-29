//
//  ContentView.swift
//  App3
//
//  Created by Braeden Casados on 5/28/23.
//

import SwiftUI

struct Option: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    let color: Color
}

struct QuizType: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    let color: Color
}

struct ContentView: View {
    var options: [Option] = [
        Option(name: "Dictionary", imageName: "book", color: .blue),
        Option(name: "Quizzes", imageName: "square.and.pencil", color: .blue)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Image("palauflag")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.accentColor)
                    .cornerRadius(25)
                    .padding(.all)
                
                List {
                    Section(header: Text("Options")) {
                        ForEach(options) { option in
                            NavigationLink(destination: DetailView(option: option)) {
                                Label(option.name, systemImage: option.imageName)
                                    .foregroundColor(option.color)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Learn Palauan")
        }
    }
}

struct DetailView: View {
    let option: Option
    
    var body: some View {
        VStack {
            if option.name == "Dictionary" {
                DictionaryView()
            } else if option.name == "Quizzes" {
                QuizzesView()
            }
        }
        .navigationBarTitle(option.name)
    }
}

struct DictionaryView: View {
    var body: some View {
        Text("Dictionary Content")
            .font(.largeTitle)
    }
}

struct QuizzesView: View {
    var options: [QuizType] = [
        QuizType(name:"Vocab", imageName: "square.and.pencil", color: .blue),
        QuizType(name:"Etymology", imageName: "square.and.pencil", color: .blue),
        QuizType(name:"Reng Expressions", imageName: "square.and.pencil", color: .blue),
        QuizType(name:"Living Things", imageName: "square.and.pencil", color: .blue),
        QuizType(name:"Synonyms", imageName: "square.and.pencil", color: .blue),
        QuizType(name:"Proverbs", imageName: "square.and.pencil", color: .blue),
        QuizType(name:"Triva", imageName: "square.and.pencil", color: .blue),
        QuizType(name:"Pronouns", imageName: "square.and.pencil", color: .blue),
        QuizType(name:"Parts of Speech", imageName: "square.and.pencil", color: .blue)
        
    ]
    
    var body: some View {
        List(options) { quizType in
            NavigationLink(destination: QuizDetailView(quizType: quizType)) {
                Label(quizType.name, systemImage: quizType.imageName)
                    .foregroundColor(quizType.color)
            }
        }
    }
}

struct QuizDetailView: View {
    let quizType: QuizType
    
    var body: some View {
        VStack {
            Text("Quiz Type: \(quizType.name)")
                .font(.largeTitle)
        }
        .navigationBarTitle(quizType.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








