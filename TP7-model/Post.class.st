Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'votes',
		'description',
		'timestamp',
		'user'
	],
	#category : #'TP7-model'
}

{ #category : #adding }
Post >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Post >> description [
	^ description
]

{ #category : #private }
Post >> description: anObject [
	description := anObject
]

{ #category : #'as yet unclassified' }
Post >> negativeVotes [
	| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifFalse:[r add: vote]].
	^r
]

{ #category : #'as yet unclassified' }
Post >> positiveVotes [
	| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifTrue:[r add: vote]].
	^r
]

{ #category : #accessing }
Post >> timestamp [
	^ timestamp
]

{ #category : #private }
Post >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Post >> user [
	^ user
]

{ #category : #private }
Post >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Post >> votes [
	^ votes
]
