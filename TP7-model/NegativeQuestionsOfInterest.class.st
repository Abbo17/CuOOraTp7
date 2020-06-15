Class {
	#name : #NegativeQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
NegativeQuestionsOfInterest >> questionsOfInterest: aUser [
	| temp4 |
	temp4 := 	aUser topics flatCollect:[ :topic | topic questions ].
	^self processRequest: ((self deleteMyQuestions: temp4 user: aUser) asSortedCollection:[ :a :b | a negativeVotes  size > b negativeVotes size ]).
]
