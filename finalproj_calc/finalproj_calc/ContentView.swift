//
//  ContentView.swift
//  fp01_calculator
//
//  Created by Thomas J Carriero on 4/18/23.
//

import SwiftUI
import CoreData

enum Operations {
    case add, subtract, multiply, divide, equal, null
}

struct ContentView: View {
    
    @State private var currentOperation: Operations = .null
    @State private var total = "0"
    @State var enteredNumber = 0.0
    @State var backgroundColor = Color.black
    @State var isBold = false

    
    let rowOneButtons: [Buttons] = [.clear, .negative, .percent, .divide]
    let rowTwoButtons: [Buttons] = [.seven, .eight, .nine, .multiply]
    let rowThreeButtons: [Buttons] = [.four, .five, .six, .subtract]
    let rowFourButtons: [Buttons] = [.one, .two, .three, .add]
    let rowFiveButtons: [Buttons] = [.zero, .decimal, .equal]
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Calculator")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold))
                            .padding(.leading, 15)
                        Spacer()
                        NavigationLink(destination:
                                        SettingsView(background: $backgroundColor, bolden: $isBold),
                                 label: {
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        })
                        .padding(.trailing, 15)
                    }
                Spacer()
                    HStack {
                        Spacer()
                        
                        Text(total)
                            .bold()
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    VStack {
                        HStack {
                            ForEach(rowOneButtons, id: \.self) { item in
                                Button(action: {
                                    self.wasClicked(button: item, operation: currentOperation)
                                }, label: {
                                    Text(item.rawValue)
                                        .fontWeight(.bold)
                                        .frame(width: 70, height: 70)
                                        .background(item.buttonColor)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                })
                            }
                        }
                        HStack {
                            ForEach(rowTwoButtons, id: \.self) { item in
                                Button(action: {
                                    self.wasClicked(button: item, operation: currentOperation)
                                }, label: {
                                    Text(item.rawValue)
                                        .fontWeight(.bold)
                                        .frame(width: 70, height: 70)
                                        .background(item.buttonColor)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                })
                            }
                        }
                        HStack {
                            ForEach(rowThreeButtons, id: \.self) { item in
                                Button(action: {
                                    self.wasClicked(button: item, operation: currentOperation)
                                }, label: {
                                    Text(item.rawValue)
                                        .fontWeight(.bold)
                                        .frame(width: 70, height: 70)
                                        .background(item.buttonColor)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                })
                            }
                        }
                        HStack {
                            ForEach(rowFourButtons, id: \.self) { item in
                                Button(action: {
                                    self.wasClicked(button: item, operation: currentOperation)
                                }, label: {
                                    Text(item.rawValue)
                                        .fontWeight(.bold)
                                        .frame(width: 70, height: 70)
                                        .background(item.buttonColor)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                })
                            }
                        }
                        HStack {
                            ForEach(rowFiveButtons, id: \.self) { item in
                                Button(action: {
                                    self.wasClicked(button: item, operation: currentOperation)
                                }, label: {
                                    Text(item.rawValue)
                                        .fontWeight(.bold)
                                        .frame(width: 70, height: 70)
                                        .background(item.buttonColor)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                })
                            }
                        }
                    }
                    .padding(3)
                }
            }
        }
    }
    
    func wasClicked(button: Buttons, operation: Operations) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            switch button {
            case .add:
                self.currentOperation = .add
                self.enteredNumber = Double(self.total) ?? 0.0
            case .subtract:
                self.currentOperation = .subtract
                self.enteredNumber = Double(self.total) ?? 0.0
            case .multiply:
                self.currentOperation = .multiply
                self.enteredNumber = Double(self.total) ?? 0.0
            case .divide:
                self.currentOperation = .divide
                self.enteredNumber = Double(self.total) ?? 0.0
            default:
                self.currentOperation = .equal
                let current = Double(self.total) ?? 0.0
                switch operation {
                case .add:
                    self.total = "\(enteredNumber + current)"
                case .subtract:
                    self.total = "\(enteredNumber - current)"
                case .multiply:
                    self.total = "\(enteredNumber * current)"
                case .divide:
                    self.total = "\(enteredNumber / current)"
                default:
                    break
                }
            }
            if button != .equal {
                self.total = "0"
            }
        case .clear:
            self.total = "0"
        case .decimal, .negative, .percent:
            if button == .decimal {
                self.total = self.total + "."
            } else if button == .negative {
                self.total = "-" + self.total
            } else if button == .percent {
                self.total = String((Double(self.total) ?? 0.0)/100)
            }
        default: let number = button.rawValue
            if self.total == "0" {
                total = number
            } else {
                self.total = "\(self.total)\(number)"
            }
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
