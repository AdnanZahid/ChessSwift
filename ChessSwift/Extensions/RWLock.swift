//
//  RWLock.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 14/11/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

final class RWLock {
    private var lock: pthread_rwlock_t
    
    // MARK: Lifecycle
    deinit {
        pthread_rwlock_destroy(&lock)
    }
    
    public init() {
        lock = pthread_rwlock_t()
        pthread_rwlock_init(&lock, nil)
    }
    
    // MARK: Public
    public func writeLock() {
        pthread_rwlock_wrlock(&lock)
    }
    
    public func readLock() {
        pthread_rwlock_rdlock(&lock)
    }
    
    public func unlock() {
        pthread_rwlock_unlock(&lock)
    }
}
