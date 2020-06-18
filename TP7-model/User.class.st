Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'questions',
		'username',
		'password',
		'topics',
		'following',
		'votes',
		'questionOfInterestStrategy'
	],
	#category : #'TP7-model'
}

{ #category : #'instance-creation' }
User class >> username: aUsername password: aPassword [
	^ self new
		username: aUsername;
		password: aPassword;
		yourself
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

{ #category : #'as yet unclassified' }
User >> defineQuestionOfInterestStrategy: aQuestionOfInterestStrategy [
	questionOfInterestStrategy := aQuestionOfInterestStrategy 
]

{ #category : #accessing }
User >> follow: aUser [
	following add: aUser 
]

{ #category : #accessing }
User >> following [
	^ following
]

{ #category : #'as yet unclassified' }
User >> followingQuestions [
	^ following flatCollect:[ :follow |  follow questions,follow questionsOfInterest ].
]

{ #category : #initialize }
User >> initialize [
	questions := OrderedCollection new.  
	topics := OrderedCollection new. 
	following := OrderedCollection new. 
	votes := OrderedCollection new.
	questionOfInterestStrategy := SocialQuestionsOfInterest new.
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

{ #category : #'as yet unclassified' }
User >> questionsOfInterest [
	^questionOfInterestStrategy questionsOfInterest: self.
]

{ #category : #accessing }
User >> topics [
	^ topics
]

{ #category : #'as yet unclassified' }
User >> topicsQuestions [
	^ topics flatCollect:[ :topic | topic questions ].
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
