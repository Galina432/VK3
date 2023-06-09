//
//  CustomNavigationControllerViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 26.05.2022.
//

import UIKit

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    var hasStarted = false
    var shouldFinish = false
}

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    let interactiveTransition = CustomInteractiveTransition()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        let edgePanGR = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        edgePanGR.edges = .left
        view.addGestureRecognizer(edgePanGR)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return PushAnimator()
        case .pop:
            return PopAnimator()
        case .none:
            return nil
        @unknown default:
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    
    @objc private func handlePanGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            //Пользователь начал тянуть - стартуем рор-анимацию и выставляем флаг hasStarted
            interactiveTransition.hasStarted = true
            self.popViewController(animated: true)
            
        case .changed:
            //Пользователь продолжает тянуть
            //расчитываем размеры экрана
            guard let width = recognizer.view?.bounds.width else {
                interactiveTransition.hasStarted = false
                interactiveTransition.cancel()
                return
            }
            //рассчитываем длину перемещения пальца
            let translation = recognizer.translation(in: recognizer.view)
            //рассчитываем процент перемещения пальца относительно размера экрана
            let relativeTranslation = translation.x / width
            let progress = max(0, min(1, relativeTranslation))
            
            //выставляем соответствующий прогресс интерактивной анимации
            interactiveTransition.update(progress)
            interactiveTransition.shouldFinish = progress > 0.45
            
        case .ended:
            //завершаем анимацию в зависимости от пройденного прогресса
            interactiveTransition.hasStarted = false
            interactiveTransition.shouldFinish ? interactiveTransition.finish() :
            interactiveTransition.cancel()
            
        case .cancelled:
            interactiveTransition.hasStarted = false
            interactiveTransition.cancel()
            
        default:
            break
        }
    }
}
