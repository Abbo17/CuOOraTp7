Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'TP7-model'
}

{ #category : #'intance creation' }
Topic class >> name: aName description: aDescription [
	^ self new
		name: aName;
		description: aDescription;
		yourself
]

{ #category : #accessing }
Topic >> addQuestion: aQuetion [
	questions add: aQuetion 
]

{ #category : #accessing }
Topic >> description [
	^ description
]

{ #category : #accessing }
Topic >> description: anObject [
	description := anObject
]

{ #category : #initialize }
Topic >> initialize [
	questions := OrderedCollection new.
]

{ #category : #accessing }
Topic >> name [
	^name
]

{ #category : #accessing }
Topic >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Topic >> questions [
	^ questions
]
