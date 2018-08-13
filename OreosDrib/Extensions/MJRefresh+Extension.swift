//
//  MJRefresh+Extension.swift
//  OreosDrib
//
//  Created by P36348 on 13/08/2018.
//  Copyright © 2018 P36348. All rights reserved.
//

import Foundation
import MJRefresh
import RxSwift

extension UIScrollView {
    func rx_pullToRefresh() -> Observable<Void> {
        if self.mj_header == nil {
            self.mj_header = MJRefreshHeader()
        }
        
        return Observable.create({ (observer) -> Disposable in
            self.mj_header.refreshingBlock = {
                observer.onNext(())
            }
            return Disposables.create()
        })
    }
    func rx_pullToLoadMore() -> Observable<Void> {

        if self.mj_footer == nil {
            self.mj_footer = MJRefreshAutoFooter()
        }
        
        return Observable.create({ (observer) -> Disposable in
             self.mj_footer.refreshingBlock = {observer.onNext(())}
            return Disposables.create()
        })
    }
    
    func rx_stopLoading() -> Observable<Void> {
        return Observable.create({ (observer) -> Disposable in
            if self.mj_header?.isRefreshing == true {
                self.mj_header.endRefreshing()
            }
            if self.mj_footer?.isRefreshing == true {
                self.mj_footer.endRefreshing()
            }
            return Disposables.create()
        })
    }
}
