//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Lucas Neves dos santos pompeu on 07/09/23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate:HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
    }
    
    // MARK: - FilterCollectionView
    
    public var numberOfItemsInSection: Int {
        return nftData?.filterListNft?.count ?? 0
    }
    
    public func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft {
        return nftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    public var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    
    // MARK: - NftTableViewCell
    
    public var numberOfRowsInSection: Int {
        return nftData?.nftList?.count ?? 0
    }
    
    public func loadCurrentNft(indexPath: IndexPath) -> Nft {
        return nftData?.nftList?[indexPath.row] ?? Nft()
    }
    
    public var heightForRowAt: CGFloat {
        return 360
    }
}
