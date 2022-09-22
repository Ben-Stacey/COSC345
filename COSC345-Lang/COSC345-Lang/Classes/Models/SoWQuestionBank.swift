//
//  SowQuestionBank.swift
//  COSC345-Lang
//
//  Created by Mahfuz Abdul Razak on 22/09/22.
//

import Foundation

class SoWQuestionBank{
    var list = [SoWQuestions]()
    
    init(){
        list.append(SoWQuestions(quest: "Select the word with the same meaning" , questWord: "Good", choiceA: "Si", choiceB: "Bueno", choiceC: "Gracias", choiceD: "El no Sabe", answer: 2))
        list.append(SoWQuestions(quest: "Select the word with the same meaning" , questWord: "Bad", choiceA: "Malo", choiceB: "tonto", choiceC: "Correr", choiceD: "Detengasse", answer: 1))
        list.append(SoWQuestions(quest: "Select the word with the same meaning" , questWord: "Hello", choiceA: "Ciao", choiceB: "Salto", choiceC: "Patada", choiceD: "Hola", answer: 4))
        list.append(SoWQuestions(quest: "Select the word with the same meaning" , questWord: "Goodbye", choiceA: "Chalupa", choiceB: "Carnitas", choiceC: "Adios", choiceD: "Fajita", answer: 3))
        list.append(SoWQuestions(quest: "Select the word with the same meaning" , questWord: "Today", choiceA: "Este Dia", choiceB: "Manana", choiceC: "El Dia de Ayer", choiceD: "La Proxima Semana", answer: 1))
    }
}
