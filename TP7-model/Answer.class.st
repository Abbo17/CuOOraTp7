Class {
	#name : #Answer,
	#superclass : #Post,
	#instVars : [
		'question'
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

{ #category : #initialize }
Answer >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]
