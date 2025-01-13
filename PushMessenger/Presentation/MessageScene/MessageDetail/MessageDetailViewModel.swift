//
//  MessageDetailViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation

struct MessageDetailViewModelActions{
    
}

protocol MessageDetailViewModelInput{
}

protocol MessageDetailViewModelOutput{
}

typealias MessageDetailViewModel = MessageDetailViewModelInput&MessageDetailViewModelOutput

final class DefaultMessageDetailViewModel:MessageDetailViewModel{
}
