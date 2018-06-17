//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Zijian Guo on 6/17/18.
//  Copyright © 2018 Zijian Guo. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    private(set) var cards = [PlayingCard]()
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
    
    init() {
        for rank in PlayingCard.Rank.all{
            for suit in PlayingCard.Suit.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
