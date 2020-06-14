Class {
	#name : #NegativeQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
NegativeQuestionsOfInterest >> questionsOfInterest: aUser [
	| temp1 temp2 temp4 |
	temp1 := OrderedCollection new.
	temp4 := OrderedCollection new.
	aUser topics do:[ :topic | temp4 addAll: topic questions ].
	temp4 := temp4 reject:[:q | q user = aUser].
	temp2 := temp4 asSortedCollection:[ :a :b | a negativeVotes  size > b negativeVotes size ].
	temp1 := temp2 last: (10 min: temp2 size).
	^temp1 
]
