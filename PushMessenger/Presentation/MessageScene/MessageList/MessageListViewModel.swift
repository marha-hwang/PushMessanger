//
//  MessageListViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation

struct MessageListViewModelActions{
    let showMessageDetail:()->Void
}

protocol MessageListViewModelInput{
}

protocol MessageListViewModelOutput{
}

typealias MessageListViewModel = MessageListViewModelInput&MessageListViewModelOutput

final class DefaultMessageListViewModel:MessageListViewModel{
}
