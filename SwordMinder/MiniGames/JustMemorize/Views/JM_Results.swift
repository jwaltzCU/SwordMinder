//
//  Results.swift
//  JustMemorize
//
//  Created by Jared Waltz on 12/5/22.
//

import SwiftUI

struct JM_Results: View {
    @ObservedObject var justMemorize: JustMemorize
    @EnvironmentObject var swordMinder: SwordMinder
    
    var verseReference: Reference
    @Binding var answer: String
    
    @Binding var currentView: JustMemorizeView.viewState
    @Binding var toggleVerse: Bool
    
    @Binding var score: Int
    //@Binding var pointsGained: Int = Int((answer.distanceJaroWinkler(between: answer)*100))
    
    var body: some View {
        VStack {
            HStack {
                Image("JMLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    Spacer()
                VStack {
                    Text("Score: \(score + (Int((answer.distanceJaroWinkler(between: answer)*100))))")
                        .foregroundColor(Color("JMLightGold"))
                        .padding()
                    //Text("Points Gained: \(Int((wholeVerse.distanceJaroWinkler(between: answer)*100)))")
                }
            }
            .padding(.horizontal)
            
            //Text(String(format: "%.0f", (wholeVerse.distanceJaroWinkler(between: answer)*100)))
            //Text(String(format: "%.0f", (swordMinder.bible.text(for: reference).distanceJaroWinkler(between: answer)*100)))
            Text("Score: \(String(format: "%.0f", (answer.distanceJaroWinkler(between: answer)*100)))")
                .font(.largeTitle)
                .padding()
                .foregroundColor(Color("JMWhite"))
            
            Text(verseReference.toString())
                .foregroundColor(Color("JMLightGold"))
            Text("\(answer)")
                .foregroundColor(Color("JMLightGold"))
            
            //.padding()
            Spacer()
            HStack {
                Spacer()
                Button("Main Menu") {
                    withAnimation {
                        currentView = .mainMenu
                    }
                }
                .foregroundColor(Color("JMLightGold"))
                    .padding()
                Spacer()
                Button("Play Again") {
                    withAnimation {
                        toggleVerse == true ? (currentView = .versePreview) : (currentView = .quizView)
                    }
                }
                .foregroundColor(Color("JMLightGold"))
                    .padding()
                Spacer()
            }
            .frame(width: 400, height: 50)
            .border(Color("JMLightGold"))
            .padding()
        }
        .background(Color("JMBlack"))
    }//body
}

//var sampleResults = "80%"

///var sampleVerse1 = "But that is not the way you learned Christ! Assuming that you have heard about him and were taught in him, as the truth is in Jesus, to put off your old self, which belongs to your former manner of life and is corrupt through deceitful desires, and to be renewed in the spirit of your minds, "
///var sampleReference = "Ephesians 4:20-24"

///var sampleVerse2 = "and to put on the new self, created after the likeness of God in true righteousness and holiness."

///var sampleVerseBlanks = "But that __ ___ the way you ______ ______! ________ that you have heard about ___ and were taught in him, as the truth is in Jesus, to ___ off your old self, which _______ to your ______ manner of life and is _______ through deceitful ______, and to be renewed in the ______ of your minds, and to put on the ___ ____, created after the ________ of ___ in true righteousness and ________."

///var wholeVerse = "But that is not the way you learned Christ! Assuming that you have heard about him and were taught in him, as the truth is in Jesus, to put off your old self, which belongs to your former manner of life and is corrupt through deceitful desires, and to be renewed in the spirit of your minds, and to put on the new self, created after the likeness of God in true righteousness and holiness."

///var answer = "But that is not the way you learned Christ! Assuming that you have heard about him and were taught in him, as the truth is in Jesus, to put off your old self, which belongs to your former manner of life and is corrupt through deceitful desires, and to be renewed in the spirit of your minds, and to put on the new self, created after the likeness of God in true righteousness and holiness."

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        let justMemorize = JustMemorize(difficulty: "Easy", reference: Reference(), toggleVerse: true, toggleTimer: true, score: 0)
        let answer = "But that is not the way you learned Christ! Assuming that you have heard about him and were taught in him, as the truth is in Jesus, to put off your old self, which belongs to your former manner of life and is corrupt through deceitful desires, and to be renewed in the spirit of your minds, and to put on the new self, created after the likeness of God in true righteousness and holiness."
        JM_Results(justMemorize: justMemorize, verseReference: Reference(book: Book(named: "Ephesians")!, chapter: 4, verse: 20), answer: .constant(answer), currentView: .constant(.results), toggleVerse: .constant(true), score: .constant(0))
            .environmentObject(SwordMinder())
    }
}
