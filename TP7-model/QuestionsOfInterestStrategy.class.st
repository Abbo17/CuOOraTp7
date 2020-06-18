Class {
	#name : #QuestionsOfInterestStrategy,
	#superclass : #Object,
	#category : #'TP7-model'
}

{ #category : #'as yet unclassified' }
QuestionsOfInterestStrategy >> deleteMyQuestions: aCollection user: aUser [
	^ aCollection reject:[:q | q isMyPost: aUser].
]

{ #category : #'as yet unclassified' }
QuestionsOfInterestStrategy >> getQuestions: aUser [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
QuestionsOfInterestStrategy >> orderQuestions: questions [
	^ self orderQuestionsByPositiveVotes: questions
]

{ #category : #'as yet unclassified' }
QuestionsOfInterestStrategy >> orderQuestionsByPositiveVotes: aColection [
	^aColection asSortedCollection:[ :a :b | a positiveVotesAmount > b positiveVotesAmount ].
]

{ #category : #'as yet unclassified' }
QuestionsOfInterestStrategy >> processRequest: aColection [
		^aColection last: (10 min: aColection size).
]

{ #category : #accessing }
QuestionsOfInterestStrategy >> questionsOfInterest: aUser [
	|questions|
	questions := self getQuestions: aUser.
	^ self processRequest: (self orderQuestions: (self deleteMyQuestions: questions user: aUser)).
]
