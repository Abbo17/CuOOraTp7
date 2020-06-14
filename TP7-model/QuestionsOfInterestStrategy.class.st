Class {
	#name : #QuestionsOfInterestStrategy,
	#superclass : #Object,
	#category : #'TP7-model'
}

{ #category : #accessing }
QuestionsOfInterestStrategy >> questionsOfInterest: aUser [
	^self subclassResponsibility 
]
