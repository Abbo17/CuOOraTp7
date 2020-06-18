Class {
	#name : #NegativeQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
NegativeQuestionsOfInterest >> questionsOfInterest: aUser [
	| questions |
	questions := 	aUser topics flatCollect:[ :topic | topic questions ].
	^self processRequest: ((self deleteMyQuestions: questions user: aUser) asSortedCollection:[ :a :b | a negativeVotes  size > b negativeVotes size ]).
]
