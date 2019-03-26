//
//  GettyRepository.swift
//  JJLStaggeredGridCollectionViewExample
//
//  Created by Jose Jimeno Linares on 23/2/17.
//  Copyright © 2017 JJL. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import RxOptional
import Moya_ObjectMapper


public protocol GettyRepository
{
    func searchImages(search : String, pageSize:Int ,numPage : Int) -> Observable<[ImgModel]>
}

class GettyRepositoryMoyaImp : GettyRepository
{

    let key : String
    //let provider : RxMoyaProvider<GettyImagesServices>
    var imageSearch : Observable<[ImgModel]>?
    let endpointClosure:(_:GettyImagesServices) -> (Endpoint)
    
    init(key:String){
        self.key = key
    }
    
    func searchImages(search: String, pageSize: Int = 50, numPage: Int = 1) -> Observable<[ImgModel]> {
        return Observable.create({ observer in
            observer.onNext([])
            observer.onCompleted()
        })
        .observeOn(MainScheduler.instance);
    }
}

public class GettyRepositoryFactory
{
    public static func provideRepository(key:String) -> GettyRepository
    {
        return GettyRepositoryMoyaImp(key:key)
    }
}
