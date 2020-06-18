Class {
	#name : #TopicsQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
TopicsQuestionsOfInterest >> questionsOfInterest: aUser [
	| questions |
	questions := (aUser topicsQuestions) select: [  :q | q lessThanDays: 90 ].
	^self processRequest: (self orderQuestionsByPositiveVotes: (self deleteMyQuestions: questions user: aUser)). 
]
