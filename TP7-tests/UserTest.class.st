Class {
	#name : #UserTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'user1',
		'user2',
		'user3',
		'topicOO1',
		'topicOO2',
		'questionUser1TopicOO1',
		'questionUser3TopicOO2',
		'questionUser2TopicOO1',
		'question2User2TopicOO1',
		'question3User2TopicOO1'
	],
	#category : #'TP7-tests'
}

{ #category : #'set up' }
UserTest >> setUp [
	user1 := User username: 'Diego' password: ''.
	user2 := User username: 'Sergio' password: ''.
	user3 := User username: 'Leandro' password: ''.
	user1 follow: user2; follow: user3.
	
	topicOO1 := Topic name: 'OO1' description: 'This topic is for discussing about OO1 issues'.
	topicOO2 := Topic name: 'OO2' description: 'This topic is for discussing about OO2 issues'.	
	user1 addTopic: topicOO1.
	user2 addTopic: topicOO2.
	user3 addTopic: topicOO2.

	cuoora := CuOOra new.
	cuoora addUser: user1; addUser: user2; addUser: user3.
	
	questionUser1TopicOO1 := Question newWithTitle: 'How to create a class in Pharo' description: '' user: user1 topic: topicOO1.

	questionUser1TopicOO1 addVote: 	(Vote user: user2 dislikesPublication: questionUser1TopicOO1).
		
	questionUser3TopicOO2 := Question newWithTitle: 'How to create a WAComponent for...' description: '' user: user3 topic: topicOO2.
	questionUser3TopicOO2 addVote: (Vote user: user1 dislikesPublication:questionUser3TopicOO2).
	questionUser3TopicOO2 addVote: (Vote user: user2 likesPublication: questionUser3TopicOO2).
	
	questionUser2TopicOO1 := Question newWithTitle: 'How to create a subclass in Pharo' description: '' user: user2 topic: topicOO1.
	questionUser2TopicOO1 addVote: (Vote user: user1 dislikesPublication:questionUser2TopicOO1).
	
	question2User2TopicOO1 := Question newWithTitle: 'How to modify a method in Pharo' description: '' user: user2 topic: topicOO1.
	question2User2TopicOO1 addVote: (Vote user: user1 dislikesPublication:question2User2TopicOO1).
	question2User2TopicOO1 addVote: (Vote user: user3 dislikesPublication:question2User2TopicOO1).

	question3User2TopicOO1 := Question newWithTitle: 'How to modify a method in Pharo' description: '' user: user2 topic: topicOO1.
	question3User2TopicOO1 addVote: (Vote user: user3 likesPublication:question3User2TopicOO1).


	cuoora addQuestion: questionUser1TopicOO1 forUser:user1.
	cuoora addQuestion: questionUser3TopicOO2 forUser:user3.
	cuoora addQuestion: questionUser2TopicOO1 forUser:user2.
	cuoora addQuestion: question2User2TopicOO1 forUser:user2.
	cuoora addQuestion: question3User2TopicOO1 forUser:user3.
	

]

{ #category : #testing }
UserTest >> testNegativeTopicsRetrieveQuestions [
	| questionUser2TopicOO2 |
	user1 defineQuestionOfInterestStrategy: (NegativeQuestionsOfInterest  new).
	user2 defineQuestionOfInterestStrategy: (NegativeQuestionsOfInterest  new).
	user3 defineQuestionOfInterestStrategy: (NegativeQuestionsOfInterest  new).
	
	self assert: (user1 questionsOfInterest) size equals: 3.
	self assert: user2 questionsOfInterest size equals: 1.
	self assert: user3 questionsOfInterest size equals: 0.
	
	questionUser2TopicOO2 := Question
		newWithTitle: 'Which bad smell...?'
		description: ''
		user: user2
		topic: topicOO2.
	cuoora addQuestion: questionUser2TopicOO2 forUser: user2.
	self assert: user2 questionsOfInterest size equals: 1.
	self assert: user3 questionsOfInterest size equals: 1.
	self
		assert: user3 questionsOfInterest first
		equals: questionUser2TopicOO2.
	self assert: user1 questionsOfInterest size equals: 3
]

{ #category : #testing }
UserTest >> testSocialRetrieveQuestions [
	| questionUser2TopicOO2 |
	
	self assert: (user1 questionsOfInterest ) size equals: 4.
	self assert: (user1 questionsOfInterest) first equals: questionUser3TopicOO2.
	
	self assert: (user2  questionsOfInterest) size equals: 0.
	self assert: (user3 questionsOfInterest) size equals: 0.
	
	questionUser2TopicOO2 := Question newWithTitle: 'Which bad smell...?' description: '' user: user2 topic: topicOO2.
	questionUser2TopicOO2 addVote: (Vote user: user2 dislikesPublication: questionUser2TopicOO2).
	cuoora addQuestion: questionUser2TopicOO2 forUser:user2.
	
	self assert: (user1 questionsOfInterest) size equals: 5.
	self assert: (user1 questionsOfInterest) last equals: question2User2TopicOO1.
	
	self assert: (user3 questionsOfInterest) size equals: 0.
	self assert: (user2 questionsOfInterest) size equals: 0.
	
	
	
	
]

{ #category : #testing }
UserTest >> testTopicsRetrieveQuestions [
	| questionUser2TopicOO2 |
	
	user1 defineQuestionOfInterestStrategy: TopicsQuestionsOfInterest new.
	user2 defineQuestionOfInterestStrategy: TopicsQuestionsOfInterest new.
	user3 defineQuestionOfInterestStrategy: TopicsQuestionsOfInterest new.
	
	self assert:(user1 questionsOfInterest ) size equals: 3.
	self assert: (user2 questionsOfInterest) size equals: 1.
	self assert: (user3 questionsOfInterest) size equals: 0.
	
	questionUser2TopicOO2 := Question newWithTitle: 'Which bad smell...?' description: '' user: user2 topic: topicOO2.
	cuoora addQuestion: questionUser2TopicOO2 forUser:user2.
	
	self assert: (user2 questionsOfInterest) size equals: 1.

	self assert: (user3 questionsOfInterest) size equals: 1.
	self assert: (user3 questionsOfInterest) first equals: questionUser2TopicOO2.
	
	self assert: (user1 questionsOfInterest) size equals: 3.
	

	
	
]
