Class {
	#name : #SocialQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
SocialQuestionsOfInterest >> questionsOfInterest: aUser [
	| questions |
	questions := aUser followingQuestions.		
	^self processRequest: (self orderQuestionsByPositiveVotes: (self deleteMyQuestions: questions user:aUser)).
]
