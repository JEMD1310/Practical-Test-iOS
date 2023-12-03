//
//  UserDetailPresenter.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 02/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class UserDetailPresenter {

    // MARK: - Private properties -

    private unowned let _view: UserDetailViewInterface
    private let _wireframe: UserDetailWireframeInterface
    private let _interactor: UserDetailInteractorInterface

    // MARK: - Lifecycle -

    init(wireframe: UserDetailWireframeInterface, view: UserDetailViewInterface, interactor: UserDetailInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
}

// MARK: - Extensions -

extension UserDetailPresenter: UserDetailPresenterInterface {
}
