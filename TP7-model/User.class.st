Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'questions',
		'answers',
		'username',
		'password',
		'topics',
		'following',
		'votes',
		'option'
	],
	#category : #'TP7-model'
}

{ #category : #'instance-creation' }
User class >> username: aUsername password: aPassword [
	^ self new
		username: aUsername;
		password: aPassword;
		defineInterestInSocial;
		yourself
]

{ #category : #accessing }
User >> addAnswer: anAnswer [
	answers add: anAnswer 

]

{ #category : #accessing }
User >> addQuestion: aQuestion [
	questions add: aQuestion
]

{ #category : #accessing }
User >> addTopic: aTopic [
	topics add: aTopic 

]

{ #category : #accessing }
User >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
User >> answers [
	^ answers
]

{ #category : #accessing }
User >> defineInterestInNegativeTopics [
option := #negativetopics.
]

{ #category : #accessing }
User >> defineInterestInSocial [
option := #social.
]

{ #category : #accessing }
User >> defineInterestInTopics [
option := #topics.
]

{ #category : #accessing }
User >> follow: aUser [
	following add: aUser 
]

{ #category : #accessing }
User >> following [
	^ following
]

{ #category : #initialize }
User >> initialize [

	questions := OrderedCollection new.  
	answers := OrderedCollection new. 
	topics := OrderedCollection new. 
	following := OrderedCollection new. 
	votes := OrderedCollection new.
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #private }
User >> password: anObject [
	password := anObject
]

{ #category : #accessing }
User >> questions [
	^ questions
]

{ #category : #accessing }
User >> questionsOfInterest [
	| temp1 temp2 temp3 temp4 |
	temp1 := OrderedCollection new.
	option = #social ifTrue:[
			temp3 := OrderedCollection new.
			self following do:[ :follow | temp3 addAll: follow questions; addAll: follow questionsOfInterest ].			
			temp3:= temp3 reject:[:q | q user = self].
			temp2 := temp3 asSortedCollection:[ :a :b | a positiveVotes size > b positiveVotes size ].
			temp1 := temp2 first: (10 min: temp2 size).
		].

	option = #topics ifTrue:[
			temp4 := OrderedCollection new.
			self topics do:[ :topic | temp4 addAll: topic questions ].
			temp4 := temp4 select: [  :q | (DateAndTime now - q timestamp) asDays < 90 ].
			temp4 := temp4 reject:[:q | q user = self].
			temp2 := temp4 asSortedCollection:[ :a :b | a positiveVotes size > b positiveVotes size ].
			temp1 := temp2 last: (10 min: temp2 size).
		].
	
	option = #negativetopics ifTrue:[
			temp4 := OrderedCollection new.
			self topics do:[ :topic | temp4 addAll: topic questions ].
			temp4 := temp4 reject:[:q | q user = self].
			temp2 := temp4 asSortedCollection:[ :a :b | a negativeVotes  size > b negativeVotes size ].
			temp1 := temp2 last: (10 min: temp2 size).
		].
	
	^temp1 
]

{ #category : #accessing }
User >> topics [
	^ topics
]

{ #category : #accessing }
User >> username [
	^ username
]

{ #category : #private }
User >> username: anObject [
	username := anObject
]

{ #category : #accessing }
User >> votes [
	^ votes
]
