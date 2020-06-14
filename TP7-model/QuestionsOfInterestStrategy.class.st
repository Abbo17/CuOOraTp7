Class {
	#name : #QuestionsOfInterestStrategy,
	#superclass : #Object,
	#category : #'TP7-model'
}

{ #category : #'as yet unclassified' }
QuestionsOfInterestStrategy >> deleteMyQuestions: aCollection user: aUser [
	^ aCollection reject:[:q | q user = aUser].
]

{ #category : #'as yet unclassified' }
QuestionsOfInterestStrategy >> orderQuestionsByPositiveVotes: aColection [
	^aColection asSortedCollection:[ :a :b | a positiveVotes size > b positiveVotes size ].
]

{ #category : #accessing }
QuestionsOfInterestStrategy >> questionsOfInterest: aUser [
	^self subclassResponsibility 
]
