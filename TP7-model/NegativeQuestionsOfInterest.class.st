Class {
	#name : #NegativeQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
NegativeQuestionsOfInterest >> getQuestions: aUser [
	^ aUser topicsQuestions.
]

{ #category : #accessing }
NegativeQuestionsOfInterest >> orderQuestions: questions [
	^ questions asSortedCollection:[ :a :b | a negativeVotesAmount > b negativeVotesAmount ].
]
