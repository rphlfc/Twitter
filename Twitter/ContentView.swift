//
//  ContentView.swift
//  Twitter
//
//  Created by Raphael Cerqueira on 31/08/21.
//

import SwiftUI

struct ContentView: View {
    var screenWidth = UIScreen.main.bounds.width
    @State var xOffset: CGFloat = 0
    @State var currentXOffset: CGFloat = 0
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        GeometryReader { reader in
            HStack(spacing: 0) {
                MenuView()
                    .frame(width: screenWidth * 0.8)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(UIColor.systemBackground))
                        .overlay(Text("Placeholder"))
                        .frame(width: screenWidth)
                    
                    (scheme == .light ? Color.black : Color.white).opacity(0.3)
                        .opacity(xOffset == 0 ? 0.7 : 0)
                        .ignoresSafeArea()
                }
            }
            .onAppear {
                xOffset = -screenWidth * 0.8 // hides the menu
                currentXOffset = xOffset
            }
            .offset(x: xOffset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        if value.translation.width > 0 && xOffset != 0 { // left to right
                            withAnimation {
                                xOffset = currentXOffset + value.translation.width
                            }
                        } else if value.translation.width < 0 && xOffset != -screenWidth * 0.8 {
                            withAnimation {
                                xOffset = currentXOffset + value.translation.width
                            }
                        }
                    })
                    .onEnded({ value in
                        if value.translation.width > 0 { // left to right
                            withAnimation {
                                xOffset = 0
                            }
                        } else {
                            withAnimation {
                                xOffset = -screenWidth * 0.8
                            }
                        }
                        currentXOffset = xOffset
                    })
            )
        }
    }
}

struct MenuView: View {
    var followerCount = 1
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image("profile")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("blue"))
                    })
                }
                
                Text("Raphael")
                    .font(.system(size: 17, weight: .bold))
                
                Text("@rphlfc")
                    .foregroundColor(.gray)
                
                HStack {
                    Text("780")
                        .fontWeight(.bold)
                    
                    Text("following")
                    
                    Text("\(followerCount)")
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    Text("follower-count \(followerCount)", tableName: "Plurals")
                }
                .padding(.top)
            }
            .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 0) {
                    ForEach(menuItems) { item in
                        Button(action: {}, label: {
                            HStack(spacing: 20) {
                                Image(systemName: item.image)
                                    .frame(width: 40, height: 40)
                                    .font(.system(size: 21, weight: .semibold))
                                    .foregroundColor(Color("foreground"))
                                
                                Text(LocalizedStringKey(item.name))
                                    .foregroundColor(.primary)
                                
                                Spacer()
                            }
                            .padding()
                        })
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    VStack(spacing: 30) {
                        Button(action: {}, label: {
                            HStack {
                                Text("settings and privacy")
                                
                                Spacer()
                            }
                        })
                        
                        Button(action: {}, label: {
                            HStack {
                                Text("help center") // if it doesn't work try cleaning the project
                                
                                Spacer()
                            }
                        })
                    }
                    .foregroundColor(Color.primary)
                    .padding(.horizontal, 25)
                    
                    Spacer()
                }
            })
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "lightbulb")
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "qrcode")
                })
            }
            .foregroundColor(Color("blue"))
            .font(.system(size: 21))
            .padding()
        }
        .background(Color(UIColor.systemBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            ContentView()
                .environment(\.locale, .init(identifier: "pt-BR"))
        }
    }
}
