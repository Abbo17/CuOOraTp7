Class {
	#name : #NegativeQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
NegativeQuestionsOfInterest >> questionsOfInterest: aUser [
	| temp1 temp2 temp4 |
	temp1 := OrderedCollection new.
	temp4 := 	aUser topics flatCollect:[ :topic | topic questions ].
	temp4 := self deleteMyQuestions: temp4 user: aUser.
	temp2 := temp4 asSortedCollection:[ :a :b | a negativeVotes  size > b negativeVotes size ].
	temp1 := 	self processRequest: temp2.
	^temp1 
]
