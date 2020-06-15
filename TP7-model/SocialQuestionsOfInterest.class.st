Class {
	#name : #SocialQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
SocialQuestionsOfInterest >> questionsOfInterest: aUser [
	| temp3 |
	temp3 := aUser following flatCollect:[ :follow |  follow questions,follow questionsOfInterest ].			
	^self processRequest: (self orderQuestionsByPositiveVotes: (self deleteMyQuestions: temp3 user:aUser)).
]
