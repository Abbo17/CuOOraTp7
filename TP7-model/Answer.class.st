Class {
	#name : #Answer,
	#superclass : #Object,
	#instVars : [
		'question',
		'timestamp',
		'user',
		'votes',
		'description'
	],
	#category : #'TP7-model'
}

{ #category : #'instance creation' }
Answer class >> new: anAnswer user: aUser [ 
	^ self new
		description: anAnswer;
		user: aUser;
		yourself
]

{ #category : #adding }
Answer >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Answer >> description [
	^ description
]

{ #category : #private }
Answer >> description: anObject [
	description := anObject
]

{ #category : #initialize }
Answer >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #'as yet unclassified' }
Answer >> negativeVotes [
	| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifFalse:[r add: vote]].
	^r
]

{ #category : #'as yet unclassified' }
Answer >> positiveVotes [
	| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifTrue:[r add: vote]].
	^r
]

{ #category : #accessing }
Answer >> timestamp [
	^ timestamp
]

{ #category : #private }
Answer >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #private }
Answer >> user [
	^user
]

{ #category : #private }
Answer >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Answer >> votes [
	^ votes
]
