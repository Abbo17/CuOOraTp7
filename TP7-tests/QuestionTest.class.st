Class {
	#name : #QuestionTest,
	#superclass : #TestCase,
	#instVars : [
		'questionWithoutVotes'
	],
	#category : #'TP7-tests'
}

{ #category : #'set up' }
QuestionTest >> setUp [
	questionWithoutVotes := Question
		newWithTitle: 'A question'
		description: 'A description'
		user: (User new).
]

{ #category : #testing }
QuestionTest >> testNegativeVotes [
	questionWithoutVotes addVote: (Vote user: (User new) dislikesPublication: questionWithoutVotes ).
	self assert: (questionWithoutVotes negativeVotes size) equals: 1.
	
	questionWithoutVotes addVote: (Vote user: (User new) dislikesPublication: questionWithoutVotes).
	self assert: (questionWithoutVotes negativeVotes size) equals: 2.
]

{ #category : #testing }
QuestionTest >> testPositiveAndNegativeVotesInterference [	
	questionWithoutVotes  addVote: (Vote user: (User new) dislikesPublication: questionWithoutVotes).
	self assert: (questionWithoutVotes positiveVotes size) equals: 0.
	self assert: (questionWithoutVotes negativeVotes size) equals: 1.
	
	questionWithoutVotes addVote: (Vote user: (User new) likesPublication: questionWithoutVotes).	
	self assert: (questionWithoutVotes positiveVotes size) equals: 1.
	self assert: (questionWithoutVotes negativeVotes size) equals: 1.
	
	self assert: questionWithoutVotes votes size equals: 2.
]

{ #category : #testing }
QuestionTest >> testPositiveVotes [
	questionWithoutVotes  addVote: (Vote user: (User new) likesPublication: questionWithoutVotes).	
	self assert: (questionWithoutVotes positiveVotes size) equals: 1.
	
	questionWithoutVotes addVote: (Vote user: (User new) likesPublication: questionWithoutVotes).	
	self assert: (questionWithoutVotes positiveVotes size) equals: 2.
	
]

{ #category : #testing }
QuestionTest >> testVotesForNewQuestion [
	self assert: (questionWithoutVotes negativeVotes size) equals: 0.
	self assert: (questionWithoutVotes positiveVotes size) equals: 0.
]
