//
//  MessageListViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation

struct MessageListViewModelActions{
    let showMessageDetail:(MessageType)->Void
}

protocol MessageListViewModelInput{
    func showDetail()
}

protocol MessageListViewModelOutput{
    var messageType:MessageType { get set }
}

typealias MessageListViewModel = MessageListViewModelInput&MessageListViewModelOutput

final class DefaultMessageListViewModel:MessageListViewModel{
    
    var messageType: MessageType = .notice
    
    private let actions:MessageListViewModelActions?
    
    init(actions: MessageListViewModelActions?) {
        self.actions = actions
    }
    
    func showDetail() {
        actions?.showMessageDetail(messageType)
    }
}
