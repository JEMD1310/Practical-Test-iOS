//
//  ListInterfaces.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 02/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum ListNavigationOption {
    case goToLogin
    case goToDetail(data: UserModel)
}

protocol ListWireframeInterface: WireframeInterface {
    func navigate(to option: ListNavigationOption)
}

protocol ListViewInterface: ViewInterface {
    func showUsers(users: [UserModel])
    func showLoading()
    func dimissLoading()
    func failure(message: String)
}

protocol ListPresenterInterface: PresenterInterface {
    func fetchUsers(last: Int)
    func presentLogin()
    func presentDetail(data: UserModel)
}

protocol ListInteractorInterface: InteractorInterface {
    func executeFetchUsers(last: Int, completionHandler: @escaping([UserModel]?, String?)-> Void)
}
