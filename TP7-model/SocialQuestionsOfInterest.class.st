Class {
	#name : #SocialQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
SocialQuestionsOfInterest >> questionsOfInterest: aUser [
	| questions |
	questions := aUser following flatCollect:[ :follow |  follow questions,follow questionsOfInterest ].			
	^self processRequest: (self orderQuestionsByPositiveVotes: (self deleteMyQuestions: questions user:aUser)).
]
