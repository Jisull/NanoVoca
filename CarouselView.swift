////
////  CardView.swift
////  NanoVoca
////
////  Created by Jisu Lee on 2023/06/07.
////
//
//
////import SwiftUI
////
////struct ScrollingHStackModifier: ViewModifier {
////
////    @State private var scrollOffset: CGFloat
////    @State private var dragOffset: CGFloat
////
////    var items: Int
////    var itemWidth: CGFloat
////    var itemSpacing: CGFloat
////
////    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
////        self.items = items
////        self.itemWidth = itemWidth
////        self.itemSpacing = itemSpacing
////
////        // Calculate Total Content Width
////        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
////        let screenWidth = UIScreen.main.bounds.width
////
////        // Set Initial Offset to first Item
////        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
////
////        self._scrollOffset = State(initialValue: initialOffset)
////        self._dragOffset = State(initialValue: 0)
////    }
////
////    func body(content: Content) -> some View {
////        content
////            .offset(x: scrollOffset + dragOffset, y: 0)
////            .gesture(DragGesture()
////                .onChanged({ event in
////                    dragOffset = event.translation.width
////                })
////                .onEnded({ event in
////                    // Scroll to where user dragged
////                    scrollOffset += event.translation.width
////                    dragOffset = 0
////
////                    // Now calculate which item to snap to
////                    let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
////                    let screenWidth = UIScreen.main.bounds.width
////
////                    // Center position of current offset
////                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
////
////                    // Calculate which item we are closest to using the defined size
////                    var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
////
////                    // Should we stay at current index or are we closer to the next item...
////                    if index.remainder(dividingBy: 1) > 0.5 {
////                        index += 1
////                    } else {
////                        index = CGFloat(Int(index))
////                    }
////
////                    // Protect from scrolling out of bounds
////                    index = min(index, CGFloat(items) - 1)
////                    index = max(index, 0)
////
////                    // Set final offset (snapping to item)
////                    let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
////
////                    // Animate snapping
////                    withAnimation {
////                        scrollOffset = newOffset
////                    }
////
////                })
////            )
////    }
////}
////
////struct CarouselView: View {
////    @State private var isClicked: [Bool] = Array(repeating: false, count: 5)
//////    var words: [String] = ["local", "allocate", "locomotive", "colocation", "dislocate"]
//////    var flippedWords: [String] = ["a. 현지의, 장소의", "v. 할당하다, 배치하다", "n. 기관차\na. 이동(보행)의", "n. 배치, 연결\n     연어(관계)", "v. 탈구시키다\n n. 혼란에 빠뜨리다"]
////
//////    let wordsCount =   words.count
////
////    var body: some View {
////        HStack(alignment: .center, spacing: 30) {
////            ForEach(0..<5, id: \.self ) { i in
////                RoundedRectangle(cornerRadius: 20)
////                    .fill(Color.B4)
////                    .frame(width: 239, height: 393)
////                    .shadow(radius: 6)
////                    .overlay {
////                        ZStack {
////                            if !isClicked[i] {
////                                FrontCardView()
////                            } else {
////                                FlippedCardView()
////                            }
////
////                        }
//////                        VStack{
//////                            Text(!isClicked[i] ? words[i] : flippedWords[i])
//////                                .fontWeight(.black)
//////                                .font(.largeTitle)
//////                        }
////
////                    }
////                    .onTapGesture {
////
////                        isClicked[i].toggle()
////                    }
////                    .id(i)
////                    .frame(width: 250, height: 400, alignment: .center)
////
////            }
////        }
////        .modifier(ScrollingHStackModifier(items: 5, itemWidth: 250, itemSpacing: 30))
////    }
////}
////
////
//
//import SwiftUI
//
//struct ScrollingHStackModifier: ViewModifier {
//    @State private var scrollOffset: CGFloat = 0
//    @State private var dragOffset: CGFloat = 0
//
//    var items: Int
//    var itemWidth: CGFloat
//    var itemSpacing: CGFloat
//
//    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
//        self.items = items
//        self.itemWidth = itemWidth
//        self.itemSpacing = itemSpacing
//    }
//
//    func body(content: Content) -> some View {
//        content
//            .offset(x: scrollOffset + dragOffset, y: 0)
//            .gesture(DragGesture()
//                .onChanged { value in
//                    dragOffset = value.translation.width
//                }
//                .onEnded { value in
//                    scrollOffset += value.translation.width
//                    dragOffset = 0
//
//                    let screenWidth = UIScreen.main.bounds.width
//                    let contentWidth = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
//
//                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
//                    var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
//
//                    if index.remainder(dividingBy: 1) > 0.5 {
//                        index += 1
//                    } else {
//                        index = CGFloat(Int(index))
//                    }
//
//                    index = min(index, CGFloat(items) - 1)
//                    index = max(index, 0)
//
//                    let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
//
//                    withAnimation {
//                        scrollOffset = newOffset
//                    }
//                }
//            )
//    }
//}
//
//
//struct CarouselView: View {
//    @State private var isClicked: [Bool] = Array(repeating: false, count: 5)
////    var words: [String] = ["local", "allocate", "locomotive", "colocation", "dislocate"]
////    var flippedWords: [String] = ["a. 현지의, 장소의", "v. 할당하다, 배치하다", "n. 기관차\na. 이동(보행)의", "n. 배치, 연결\n     연어(관계)", "v. 탈구시키다\n n. 혼란에 빠뜨리다"]
//
//    var body: some View {
//        HStack(alignment: .center, spacing: 30) {
//            ForEach(0..<5, id: \.self ) { i in
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.gray)
//                    .frame(width: 239, height: 393)
//                    .shadow(radius: 6)
//                    .overlay {
//                        ZStack {
//                            if !isClicked[i] {
//                                FrontCardView()
//                                    .overlay(
//                                        VStack {
//                                            Text(words[i])
//                                                .fontWeight(.black)
//                                                .font(.largeTitle)
//                                        }
//                                    )
//                            } else {
//                                FlippedCardView()
//                                    .overlay(
//                                        VStack {
//                                            Text(flippedWords[i])
//                                                .fontWeight(.black)
//                                                .font(.largeTitle)
//                                        }
//                                    )
//                            }
//                        }
//                    }
//                    .onTapGesture {
//                        isClicked[i].toggle()
//                    }
//                    .id(i)
//                    .frame(width: 250, height: 400, alignment: .center)
//            }
//        }
//        .modifier(ScrollingHStackModifier(items: 5, itemWidth: 250, itemSpacing: 30))
//    }
//}
//
//
//struct CarouselView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        CarouselView()
//
//    }
//}
//
//

import SwiftUI

struct ScrollingHStackModifier: ViewModifier {
    @State private var scrollOffset: CGFloat = 0
    @State private var dragOffset: CGFloat = 0

    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat

    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
    }

    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged { value in
                    dragOffset = value.translation.width
                }
                .onEnded { value in
                    scrollOffset += value.translation.width
                    dragOffset = 0

                    let screenWidth = UIScreen.main.bounds.width
                    let contentWidth = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing

                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                    var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)

                    if index.remainder(dividingBy: 1) > 0.5 {
                        index += 1
                    } else {
                        index = CGFloat(Int(index))
                    }

                    index = min(index, CGFloat(items) - 1)
                    index = max(index, 0)

                    let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing

                    withAnimation {
                        scrollOffset = newOffset
                    }
                }
            )
    }
}

struct WordPair {
    var word: String
    var flippedWord: String
}

struct WordData {
    static let wordPairs: [WordPair] = [
        WordPair(word: "local", flippedWord: "a. 현지의, 장소의"),
        WordPair(word: "allocate", flippedWord: "v. 할당하다, 배치하다"),
        WordPair(word: "locomotive", flippedWord: "n. 기관차\na. 이동(보행)의"),
        WordPair(word: "colocation", flippedWord: "n. 배치, 연결\n     연어(관계)"),
        WordPair(word: "dislocate", flippedWord: "v. 탈구시키다\n n. 혼란에 빠뜨리다")
    ]
}

struct CardView: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.B4)
            .frame(width: 239, height: 393)
            .cornerRadius(20)
            .shadow(radius: 6)
            .overlay {
                VStack {
                    Text(text)
                }
            }
    }
}

struct FrontCardView: View {
    var word: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .modifier(CardView(text: word))
    }
}

struct FlippedCardView: View {
    var flippedWord: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .modifier(CardView(text: flippedWord))
    }
}


//struct FrontCardView: View {
//    var word: String
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: 20)
//            .fill(Color.B1)
//            .frame(width: 239, height: 393)
//            .shadow(radius: 6)
//            .overlay {
//                VStack {
//                    Text(word)
//                        .fontWeight(.black)
//                        .font(.largeTitle)
//                }
//            }
//    }
//}
//
//struct FlippedCardView: View {
//    var flippedWord: String
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: 20)
//            .fill(Color.B1)
//            .frame(width: 239, height: 393)
//            .shadow(radius: 6)
//            .overlay {
//                VStack {
//                    Text(flippedWord)
//                        .fontWeight(.black)
//                        .font(.largeTitle)
//                }
//            }
//    }
//}

struct CarouselView: View {
    @State private var isClicked: [Bool] = Array(repeating: false, count: WordData.wordPairs.count)
    let wordPairs = WordData.wordPairs
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            ForEach(0..<wordPairs.count, id: \.self) { i in
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.B4)
//                    .frame(width: 239, height: 393)
//                    .shadow(radius: 6)
//                    .overlay {
                        ZStack {
                            if !isClicked[i] {
                                FrontCardView(word: wordPairs[i].word)        .font(.system(size: 36, weight: .bold))

                            } else {
                                FlippedCardView(flippedWord: wordPairs[i].flippedWord)
                                    .font(.system(size: 10, weight: .bold))
                            }
                        }
//                    }
                    .onTapGesture {
                        isClicked[i].toggle()
                    }
                    .id(i)
                    .frame(width: 250, height: 400, alignment: .center)
            }
        }
        .modifier(ScrollingHStackModifier(items: wordPairs.count, itemWidth: 250, itemSpacing: 30))
    }
}


struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
