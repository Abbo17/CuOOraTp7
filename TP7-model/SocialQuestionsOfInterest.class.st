Class {
	#name : #SocialQuestionsOfInterest,
	#superclass : #QuestionsOfInterestStrategy,
	#category : #'TP7-model'
}

{ #category : #accessing }
SocialQuestionsOfInterest >> getQuestions: aUser [
	^ aUser followingQuestions.
]
