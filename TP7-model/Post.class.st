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

{ #category : #initialization }
Post >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #'as yet unclassified' }
Post >> negativeVotes [
	^votes select:[:vote | vote isLike not]
]

{ #category : #'as yet unclassified' }
Post >> positiveVotes [
	^votes select:[:vote | vote isLike ].
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
