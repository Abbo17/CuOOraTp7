Class {
	#name : #TopicsQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
TopicsQuestionsOfInterest >> questionsOfInterest: aUser [
	| temp4 |
	temp4 := (aUser topics flatCollect: [ :topic | topic questions ]) select: [  :q | (DateAndTime now - q timestamp) asDays < 90 ].
	^self processRequest: (self orderQuestionsByPositiveVotes: (self deleteMyQuestions: temp4 user: aUser)). 
]
