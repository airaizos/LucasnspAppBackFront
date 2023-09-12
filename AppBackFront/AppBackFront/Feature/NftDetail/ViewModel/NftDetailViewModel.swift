//
//  NftDetailViewModel.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 11/09/23.
//

import UIKit

class NftDetailViewModel: NSObject {

    private let nft: Nft
    
    init(nft: Nft) {
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 1
    }
    
    public var nftImage: String {
        return nft.nftImage ?? ""
    }

}