//
//  MainAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

typealias MainModule = Module<MainModuleInput, MainModuleOutput>

class MainAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> MainModule {
        
        // View
        let view = MainViewController.controllerFromStoryboard(.main)
        
        // Services
        let questionDataService = container.resolve(QuestionDataServiceAssembly.self).build()
        
        // Interactor
        let interactor = MainInteractor(questionDataService: questionDataService)
        
        // Router
        let router = MainRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = MainPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
