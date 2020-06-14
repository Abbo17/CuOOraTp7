Class {
	#name : #SocialQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
SocialQuestionsOfInterest >> questionsOfInterest: aUser [
	| temp1 temp2 temp3 temp4 |
	
	temp1 := OrderedCollection new.
	temp3 := OrderedCollection new.
	aUser following do:[ :follow | temp3 addAll: follow questions; addAll: follow questionsOfInterest ].			
	temp3:= temp3 reject:[:q | q user = self].
	temp2 := temp3 asSortedCollection:[ :a :b | a positiveVotes size > b positiveVotes size ].
	temp1 := temp2 first: (10 min: temp2 size).
	
	^temp1 
]
