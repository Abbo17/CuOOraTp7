Class {
	#name : #SocialQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
SocialQuestionsOfInterest >> questionsOfInterest: aUser [
	| temp1 temp2 temp3 |
	temp1 := OrderedCollection new.
	temp3 := aUser following flatCollect:[ :follow |  follow questions,follow questionsOfInterest ].			
	temp3:= temp3 reject:[:q | q user = aUser].
	temp2 := temp3 asSortedCollection:[ :a :b | a positiveVotes size > b positiveVotes size ].
	temp1 := temp2 first: (10 min: temp2 size).
	
	^temp1 
]
