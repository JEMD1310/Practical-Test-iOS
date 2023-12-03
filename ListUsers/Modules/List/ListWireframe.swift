//
//  ListWireframe.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 02/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ListWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = _storyboard.instantiateViewController(ofType: ListViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ListInteractor()
        let presenter = ListPresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }
    
    func showLogin() {
        self.navigationController?.dismiss(animated: true, completion: {
            let wireframe = LoginWireframe()
            self.navigationController?.presentWireframeOnNewNavController(wireframe)
        })
    }

    func showDetail(data: UserModel) {
        let wireframe = UserDetailWireframe(data: data)
        navigationController?.pushWireframe(wireframe)
    }

}

// MARK: - Extensions -

extension ListWireframe: ListWireframeInterface {

    func navigate(to option: ListNavigationOption) {
        switch option {
        case .goToLogin:
            showLogin()
        case .goToDetail(let data):
            showDetail(data: data)
        }
    }
}