Class {
	#name : #NegativeQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
NegativeQuestionsOfInterest >> questionsOfInterest: aUser [
	| questions |
	questions := aUser topicsQuestions.
	^self processRequest: ((self deleteMyQuestions: questions user: aUser) asSortedCollection:[ :a :b | a negativeVotesAmount > b negativeVotesAmount ]).
]
