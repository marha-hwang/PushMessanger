//
//  MessageListViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation

struct MessageListViewModelActions{
    let showMessageDetail:(Message)->Void
}

protocol MessageListViewModelInput{
    func showDetail()
}

protocol MessageListViewModelOutput{
    var messageType:MessageType { get }
}

typealias MessageListViewModel = MessageListViewModelInput&MessageListViewModelOutput

final class DefaultMessageListViewModel:MessageListViewModel{
    
    private let actions:MessageListViewModelActions?
    
    var messageType: MessageType
    
    init(messageType: MessageType, actions: MessageListViewModelActions?) {
        self.messageType = messageType
        self.actions = actions
    }
    
    func showDetail() {
        actions?.showMessageDetail(Message())
    }
}
