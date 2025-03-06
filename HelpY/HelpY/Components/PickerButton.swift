//
//  PickerButton.swift
//  HelpY
//
//  Created by Apprenant 45 on 05/02/2025.
//

import SwiftUI

struct PickerButtonView: View {
    @State var selection = 0

    init() {
            UISegmentedControl.appearance().selectedSegmentTintColor = .init(white: 30, alpha: 30)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
            UISegmentedControl.appearance().backgroundColor = .systemGray6
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.white)
    }
    var body: some View {
        VStack {

            ZStack {
                VStack {
                    switch selection {
                    case 0:
                        MapRequestView()
                    case 1:
                        ListRequestView()

                    default:
                        MapRequestView()
                    }
                }

                VStack {
                    Picker(selection: $selection, label: Text("test")) {
                        Text("Carte").tag(0)
                        Text("Liste").tag(1)

                    }
                    .pickerStyle(.segmented)

                    .padding(.horizontal, 20)
                }.padding(.top, 600)
            }

        }
    }
}
#Preview {
    PickerButtonView()
}
