//
//  ViewController.swift
//  Millas a metros
//
//  Created by alejandro gonzalez casado .
//  Copyright © 2018 Idrilplays. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var distanceTextField: UITextField!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var segmentedControl2: UISegmentedControl!
    
    @IBOutlet var resultLabel: UILabel!
    
    let milleUnit : Double = 1.609
    let kmtoYard : Double = 1093.61
    let mitoYard : Double = 1760
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //fragmento que se ejecuta nada mas lanzar la app
        
        resultLabel.text = "Escribe la distancia a convertir para que se muestre"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertPressed(_ sender: UIButton) {
        
        
        let selectedIndex = segmentedControl.selectedSegmentIndex
        let selectedIndex2 = segmentedControl2.selectedSegmentIndex
        // primera exclamación asegura de que va a llegar un texto,y la segunda que ese texto se va a poder convertir en un valor decimal,double
        
        if let textFieldStr = distanceTextField.text, let textFieldValue = Double(textFieldStr) {
        
        
            if selectedIndex == selectedIndex2 {
            resultLabel.text = "Su valor, \(textFieldValue) es el mismo. Por favor,pulse otra casilla para poder convertir su valor"
                } else if selectedIndex == 0 && selectedIndex2 == 1 {
                    let convertedValue = textFieldValue * milleUnit // Milla a KM
                    reloadView(textFieldValue: textFieldValue, convertedValue: convertedValue)
                }else if selectedIndex == 0 && selectedIndex2 == 2 {
                    let convertedValue = textFieldValue * mitoYard // Millas a Yardas
                    reloadView(textFieldValue: textFieldValue, convertedValue: convertedValue)
                }else if selectedIndex == 1 && selectedIndex2 == 0 {
                    let convertedValue = textFieldValue * milleUnit // KM a Millas
                    reloadView(textFieldValue: textFieldValue, convertedValue: convertedValue)
                }else if selectedIndex == 1 && selectedIndex2 == 2 {
                    let convertedValue = textFieldValue * kmtoYard // KM a Yardas
                    reloadView(textFieldValue: textFieldValue, convertedValue: convertedValue)
                }else if selectedIndex == 2 && selectedIndex2 == 0 {
                    let convertedValue = textFieldValue / mitoYard // Yardas a Millas
                    reloadView(textFieldValue: textFieldValue, convertedValue: convertedValue)
                } else if selectedIndex == 2 && selectedIndex2 == 1 {
                    let convertedValue = textFieldValue / kmtoYard // Yardas a KM
                reloadView(textFieldValue: textFieldValue, convertedValue: convertedValue)
            }else {
            resultLabel.text = "No debe de haber caso alguno"
            }
        }else {
                resultLabel.text = "Escriba la distancia a convertir."
            }
        
        
       /* // old code 
if selectedIndex == 0 {
            let convertedValue = textFieldValue / milleUnit
            reloadView(textFieldValue: textFieldValue, convertedValue: convertedValue)
        } else if selectedIndex == 1 {
            let convertedValue = textFieldValue * milleUnit
            reloadView(textFieldValue: textFieldValue, convertedValue: convertedValue)
        } else { print("No hay caso contemplado")
        
        }
        
        if distanceTextField.text == "" {
            resultLabel.text = " No has introducido nada"
        }
    */
        
    }

    func reloadView(textFieldValue: Double, convertedValue : Double){
        let initValue = String(format: "%.2f", textFieldValue)
        let endValue = String(format: "%.2f",convertedValue)
        let selectedIndex = segmentedControl.selectedSegmentIndex
        let selectedIndex2 = segmentedControl2.selectedSegmentIndex
        
        if selectedIndex == selectedIndex2 {
           resultLabel.text = " Por favor,pulse otra casilla para poder convertir su valor"}
        else if selectedIndex == 0 && selectedIndex2 == 1 {
           resultLabel.text = "\(initValue) Millas = \(endValue) KM"}
        else if selectedIndex == 0 && selectedIndex2 == 2 {
        resultLabel.text = "\(initValue) Millas = \(endValue) Yardas "}
        else if selectedIndex == 1 && selectedIndex2 == 0 {
        resultLabel.text = "\(initValue) KM = \(endValue) Millas "}
        else if selectedIndex == 1 && selectedIndex2 == 2 {
        resultLabel.text = "\(initValue) KM = \(endValue) Yardas "}
        else if selectedIndex == 2 && selectedIndex2 == 0 {
        resultLabel.text = "\(initValue) Yardas  = \(endValue) Millas "}
        else if selectedIndex == 2 && selectedIndex2 == 1  {
            resultLabel.text = "\(initValue) Yardas  = \(endValue) KM"}
        
        
        
        /* resultLabel.text = "\(initValue)  =  \(endValue)"*/
    }
    override var prefersStatusBarHidden: Bool {
        return true }
    
}



    


