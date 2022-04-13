//
//  Coordinator.swift
//  Marvel Project
//
//  Created by Guido Mola on 07/04/2022.
//

import Foundation
import UIKit

public protocol Coordinatable: class, Presentable {
    var router: RouterType { get }
    var onCompletion: (() -> Void)? { get set }
    func start()
}

open class Coordinator: NSObject, Coordinatable {
    
    public var childCoordinators: [Coordinator] = []
    public var router: RouterType
    open var onCompletion: (() -> Void)?
    
    public init(router: RouterType) {
        self.router = router
        super.init()
    }
    
    open func start() {}
    
    public func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    public func removeChild(_ coordinator: Coordinator) {
        if let index = childCoordinators.index(of: coordinator) {
            childCoordinators.remove(at: index)
        }
    }
    
    public func removeChilds() {
        let childCoordinators = self.childCoordinators
        for coordinator in childCoordinators {
            self.removeChild(coordinator)
        }
    }
    
    // Make this function open so we can override it in a different module
    open func toPresentable() -> UIViewController {
        return router.toPresentable()
    }
}
