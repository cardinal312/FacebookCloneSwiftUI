//
//  CreatePostView.swift
//  FacebookClone
//
//  Created by Macbook on 20/2/24.
//

import SwiftUI

struct CreatePostView: View {
    @Environment(\.dismiss) private var dissmis
    
    @State var mindText: String = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Divider()
                HStack(alignment: .top) {
                    Image("me")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                        .padding(.leading, 7)
                    VStack(alignment: .leading) {
                        Text("Cardinal 312")
                        HStack {
                            ChoiceView(iconName: "person.2.fill", iconText: "Friends")
                            ChoiceView(iconName: "", iconText: "Album")
                        }
                        ChoiceView(iconName: "camera", iconText: "Off")
                    }
                    .padding(.horizontal, 12)
                }
                .padding()
                TextField("What's on your mind?", text: $mindText, axis: .vertical)
                    .padding(.leading, 30)
                Spacer()
                Divider()
                HStack(spacing: 50) {
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "photo.fill.on.rectangle.fill")
                            .foregroundStyle(.green)
                    })
                    Button(action: {}, label: {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.blue)
                    })
                    Button(action: {}, label: {
                        Image(systemName: "face.smiling")
                            .foregroundStyle(.yellow)
                    })
                    Button(action: {}, label: {
                        Image(systemName: "pin")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(.red)
                    })
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .foregroundStyle(Color(.darkGray))
                    })
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: {
                            dissmis()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        })
                        Text("Create Post")
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 80, height: 35)
                            .foregroundStyle(mindText.count == 0 ? Color(.darkGray) : .white)
                            .background(mindText.count == 0 ? Color(.systemGray5) : .blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .disabled(mindText.count == 0)
                }
            }
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
