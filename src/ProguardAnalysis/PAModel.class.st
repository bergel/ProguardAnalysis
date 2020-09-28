Class {
	#name : #PAModel,
	#superclass : #Object,
	#instVars : [
		'rules'
	],
	#category : #ProguardAnalysis
}

{ #category : #adding }
PAModel >> addRule: r [ 
	rules add: r
]

{ #category : #'as yet unclassified' }
PAModel >> importFilename: filename [
	| fr |
	fr := filename asFileReference.
	self importFromString: fr contents
]

{ #category : #'as yet unclassified' }
PAModel >> importFromString: string [
	| ss r |
	string lines allButFirst do: [ :l |
		ss := (l substrings: ',').
		r := PARule new.
		r app: ss first.
		r path: ss second.
		r group: ss third.
		r option: ss fourth.
		self addRule: r
	]
]

{ #category : #initialization }
PAModel >> initialize [
	super initialize.
	rules := OrderedCollection new
]

{ #category : #'as yet unclassified' }
PAModel >> numberOfRules [
	^ rules size
]

{ #category : #initialization }
PAModel >> rules [
	^ rules
]
