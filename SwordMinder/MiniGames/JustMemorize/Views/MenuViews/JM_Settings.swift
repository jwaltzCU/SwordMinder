//
//  Settings.swift
//  JustMemorize
//
//  Created by Jared Waltz on 12/5/22.
//

import SwiftUI

// later this struct will serve for ALL of the settings. I'd like to keep all of them in one navigation stack if I can.
struct JM_Settings: View {
    @State var toggleVerse: Bool = true
    
    @State var toggleTimer: Bool = true
    
    var difficulties = ["Easy", "Medium", "Hard"]
    @State var selectedDifficulty = "Easy"
    
    var inputTypes = ["Dictation", "Typing"]
    @State var selectedInput = "Typing"
    
    // Consider a scroll view if necessary.
    var body: some View {
        ZStack {
            VStack {
                VStack{
                    Text("(Just Memorize Logo)")
                        .padding()
                        .border(.black)
                        .foregroundColor(Color("JMLightGold"))
                    Spacer()
                    // Difficulty Selection
                    Text("Difficulty")
                        .foregroundColor(Color("JMLightGold"))
                    Picker ("Difficulty Picker", selection: $selectedDifficulty) {
                        ForEach(difficulties, id: \.self) {
                            Text($0)
                        }
                        .foregroundColor(Color("JMLightGold"))
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("Current Difficulty: \(selectedDifficulty)")
                    //Text("Difficulty: \(justMemorize.difficultyMultiplier(difficulty: selectedDifficulty))")
                        .foregroundColor(Color("JMLightGold"))
                    Spacer()
                    //Input Type
                    Text("Input Type:")
                        .foregroundColor(Color("JMLightGold"))
                    Picker ("Input Picker", selection: $selectedInput) {
                        ForEach(inputTypes, id: \.self) {
                            Text($0)
                        }
                        .foregroundColor(Color("JMLightGold"))
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Spacer()
                }
                
                // Show verse?
                HStack {
                    Toggle(isOn: $toggleVerse) {
                        Text("Show Verse First")
                            .foregroundColor(Color("JMLightGold"))
                    }
                    .tint(Color("JMLightGold"))
                    .padding()
                }
                //Show timer?
                HStack {
                    Toggle(isOn: $toggleTimer) {
                        Text("Show Timer")
                            .foregroundColor(Color("JMLightGold"))
                    }
                    .tint(Color("JMLightGold"))
                    .padding()
                }
                .background(Color("JMBlack"))
            }
            .background(Color("JMBlack"))
        }//zstack
        .frame(maxWidth: 100000, maxHeight: 100000)
        .background(Color("JMBlack"))
    }//Body
}//Settings Struct

// It may be easier to not have this but I keep getting errors in button. It also serves as a good placeholder for later.
private func nothing() {
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        //let justMemorize = JustMemorize()
        JM_Settings()
    }
}
