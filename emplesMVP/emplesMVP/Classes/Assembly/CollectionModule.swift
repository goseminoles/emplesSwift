//
//  CollectionFactory.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Dip

let collectionModule = DependencyContainer() { container in
    
    container.register() {EmplesItemRouter() as EmplesItemRouter}
        .resolvingProperties { container, router in
            let menuRouter = try container.resolve() as EmplesMenuRouter
            router.viewController = menuRouter.viewController
            router.window = menuRouter.window
            router.module = detailModule
    }
    container.register(.shared) {EmplesAreasModel($0) as EmplesAreasModel}
    
    container.register(tag: MenuSelectedItem.List) { try listModule.resolve() as CollectionViewProtocol as CollectionViewProtocol }
    container.register(tag: MenuSelectedItem.Grid) { try gridModule.resolve() as CollectionViewProtocol as CollectionViewProtocol }
    container.register(tag: MenuSelectedItem.Gallery) { try galleryModule.resolve() as CollectionViewProtocol as CollectionViewProtocol }
    container.register(tag: MenuSelectedItem.Stack) { try stackModule.resolve() as CollectionViewProtocol as CollectionViewProtocol }
    container.register(tag: MenuSelectedItem.Carousel) { try carouselModule.resolve() as CollectionViewProtocol as CollectionViewProtocol }
    
    let _ = [listModule, gridModule, stackModule, galleryModule, carouselModule, dataLayerModule]
        .map{$0.collaborate(with:container)}
}


let carouselModule = DependencyContainer() { container in
    
    container.register() {EmplesCarouselView() as CollectionViewProtocol}
        .resolvingProperties { container, view in
            view.presenter = try container.resolve() as EmplesCarouselPresenter
    }
    container.register() {EmplesCarouselPresenter($0) as EmplesCarouselPresenter}
        .resolvingProperties { container, presenter in
            presenter.view = try container.resolve() as CollectionViewProtocol
            presenter.router = try container.resolve() as EmplesItemRouter
    }
}

let galleryModule = DependencyContainer() { container in
    
    container.register() {EmplesGalleryView() as CollectionViewProtocol}
        .resolvingProperties { container, view in
            view.presenter = try container.resolve() as EmplesGalleryPresenter
    }
    container.register() {EmplesGalleryPresenter($0) as EmplesGalleryPresenter}
        .resolvingProperties { container, presenter in
            presenter.view = try container.resolve() as CollectionViewProtocol
            presenter.router = try container.resolve() as EmplesItemRouter
    }
}

let gridModule = DependencyContainer() { container in
    
    container.register() {EmplesGridView() as CollectionViewProtocol}
        .resolvingProperties { container, view in
            view.presenter = try container.resolve() as EmplesGridPresenter
    }
    container.register() {EmplesGridPresenter($0) as EmplesGridPresenter}
        .resolvingProperties { container, presenter in
            presenter.view = try container.resolve() as CollectionViewProtocol
            presenter.router = try container.resolve() as EmplesItemRouter
    }
}

let listModule = DependencyContainer() { container in
    
    container.register() {EmplesListView() as CollectionViewProtocol}
        .resolvingProperties { container, view in
            view.presenter = try container.resolve() as EmplesListPresenter
    }
    container.register() {EmplesListPresenter($0) as EmplesListPresenter}
        .resolvingProperties { container, presenter in
            presenter.view = try container.resolve() as CollectionViewProtocol
            presenter.router = try container.resolve() as EmplesItemRouter
    }
}

let stackModule = DependencyContainer() { container in
    
    container.register() {EmplesStackedView() as CollectionViewProtocol}
        .resolvingProperties { container, view in
            view.presenter = try container.resolve() as EmplesStackedPresenter
    }
    container.register() {EmplesStackedPresenter($0) as EmplesStackedPresenter}
        .resolvingProperties { container, presenter in
            presenter.view = try container.resolve() as CollectionViewProtocol
            presenter.router = try container.resolve() as EmplesItemRouter
    }
}


