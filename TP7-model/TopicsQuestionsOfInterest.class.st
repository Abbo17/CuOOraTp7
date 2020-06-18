Class {
	#name : #TopicsQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
TopicsQuestionsOfInterest >> getQuestions: aUser [
	^(aUser topicsQuestions) select: [  :q | q lessThanDays: 90 ].
]
