//
//  TicketingViewModel.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/08/16.
//

import Foundation
import Combine

class TicketingWebViewModel: ObservableObject {
    var foo = PassthroughSubject<Bool, Never>()
    var bar = PassthroughSubject<Bool, Never>()
    
    var cancellables: Set<AnyCancellable> = []
}

