Class {
	#name : #TopicsQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
TopicsQuestionsOfInterest >> questionsOfInterest: aUser [
	| temp1 temp2 temp4 |
	temp1 := OrderedCollection new.
	temp4 := aUser topics flatCollect: [ :topic | topic questions ].
	temp4 := temp4 select: [  :q | (DateAndTime now - q timestamp) asDays < 90 ].
	temp4 := self deleteMyQuestions: temp4 user: aUser.
	temp2 := self orderQuestionsByPositiveVotes: temp4.
	temp1 := temp2 last: (10 min: temp2 size).
	
	^temp1 
]
