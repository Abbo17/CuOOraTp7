Class {
	#name : #TopicsQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
TopicsQuestionsOfInterest >> questionsOfInterest: aUser [
	| questions |
	questions := (aUser topics flatCollect: [ :topic | topic questions ]) select: [  :q | (DateAndTime now - q timestamp) asDays < 90 ].
	^self processRequest: (self orderQuestionsByPositiveVotes: (self deleteMyQuestions: questions user: aUser)). 
]
