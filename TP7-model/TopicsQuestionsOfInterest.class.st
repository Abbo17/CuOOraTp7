Class {
	#name : #TopicsQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
TopicsQuestionsOfInterest >> questionsOfInterest: aUser [
	| temp1 temp2 temp3 temp4 |
	temp1 := OrderedCollection new.
	temp4 := OrderedCollection new.
	
	aUser topics do:[ :topic | temp4 addAll: topic questions ].
	temp4 := temp4 select: [  :q | (DateAndTime now - q timestamp) asDays < 90 ].
	temp4 := temp4 reject:[:q | q user = aUser].
	temp2 := temp4 asSortedCollection:[ :a :b | a positiveVotes size > b positiveVotes size ].
	temp1 := temp2 last: (10 min: temp2 size).
	
	^temp1 
]
