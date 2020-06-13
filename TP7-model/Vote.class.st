Class {
	#name : #Vote,
	#superclass : #Object,
	#instVars : [
		'isLike',
		'timstamp',
		'publication',
		'user',
		'timestamp'
	],
	#category : #'TP7-model'
}

{ #category : #'instance creation simple' }
Vote class >> negative: aUser [ 
	^self new intialize: aUser value: false. 
]

{ #category : #'instance creation' }
Vote class >> positive: aUser [
	^self new intialize: aUser value:true.
]

{ #category : #'instance creation' }
Vote class >> user: aUser dislikesPublication: aPublication [
	^ self new
		user: aUser;
		publication: aPublication;
		dislike;
		yourself
]

{ #category : #'instance creation' }
Vote class >> user: aUser likesPublication: aPublication [
	^ self new
		user: aUser;
		publication: aPublication;
		yourself
]

{ #category : #private }
Vote >> dislike [
	isLike := false.
]

{ #category : #initialize }
Vote >> initialize [
	isLike := true.
	timstamp := DateAndTime now.
	
]

{ #category : #'initialization - private' }
Vote >> intialize: aUser value: aBoolean [ 
	user:=aUser.
	isLike:= aBoolean.
	timestamp := DateAndTime now.
]

{ #category : #accessing }
Vote >> isLike [
	^ isLike
]

{ #category : #private }
Vote >> like [
	isLike := true.
]

{ #category : #accessing }
Vote >> publication [
	^ publication
]

{ #category : #private }
Vote >> publication: anObject [
	publication := anObject
]

{ #category : #'as yet unclassified' }
Vote >> toggle [
	isLike := isLike not.
]

{ #category : #accessing }
Vote >> user [
	^ user
]

{ #category : #private }
Vote >> user: anObject [
	user := anObject
]
