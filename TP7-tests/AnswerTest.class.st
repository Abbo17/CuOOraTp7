Class {
	#name : #AnswerTest,
	#superclass : #TestCase,
	#instVars : [
		'answerWithoutVotes'
	],
	#category : #'TP7-tests'
}

{ #category : #setup }
AnswerTest >> setUp [
	answerWithoutVotes := Answer new:'An answer'  user:(User new).
]

{ #category : #testing }
AnswerTest >> testNegativeVotes [
	answerWithoutVotes addVote: (Vote user: (User new) likesPublication: answerWithoutVotes).	
	self assert: (answerWithoutVotes positiveVotesAmount) equals: 1.
	
	answerWithoutVotes addVote: (Vote user: (User new) likesPublication: answerWithoutVotes).	
	self assert: (answerWithoutVotes positiveVotesAmount) equals: 2.
]

{ #category : #testing }
AnswerTest >> testPositiveAndNegativeVotesInterference [
	
	answerWithoutVotes  addVote: (Vote user: (User new) dislikesPublication: answerWithoutVotes).
	self assert: (answerWithoutVotes positiveVotesAmount) equals: 0.
	
	answerWithoutVotes addVote: (Vote user: (User new) likesPublication: answerWithoutVotes).	
	self assert: (answerWithoutVotes positiveVotesAmount) equals: 1.
	
	answerWithoutVotes addVote: (Vote user: (User new) likesPublication: answerWithoutVotes).	
	self assert: (answerWithoutVotes positiveVotesAmount) equals: 2.
	
	answerWithoutVotes addVote: (Vote user: (User new) dislikesPublication: answerWithoutVotes).
	self assert: (answerWithoutVotes positiveVotesAmount) equals: 2.
	
	self assert: answerWithoutVotes votes size equals: 4.
]

{ #category : #testing }
AnswerTest >> testPositiveVotes [
	self assert: (answerWithoutVotes positiveVotes isEmpty ).
	
	answerWithoutVotes addVote: (Vote user: (User new) dislikesPublication: answerWithoutVotes).
	self assert: (answerWithoutVotes positiveVotes isEmpty ).
	
	answerWithoutVotes addVote: (Vote user: (User new) likesPublication: answerWithoutVotes).	
	self assert: (answerWithoutVotes positiveVotesAmount) equals: 1.
	
	answerWithoutVotes addVote: (Vote user: (User new) likesPublication: answerWithoutVotes).	
	self assert: (answerWithoutVotes positiveVotesAmount) equals: 2.
	
	answerWithoutVotes addVote: (Vote user: (User new) dislikesPublication: answerWithoutVotes).
	self assert: (answerWithoutVotes positiveVotesAmount) equals: 2.
]

{ #category : #testing }
AnswerTest >> testVotesForNewAnswer [
	self assert: (answerWithoutVotes negativeVotesAmount) equals: 0.
	self assert: (answerWithoutVotes negativeVotesAmount) equals: 0.
]
