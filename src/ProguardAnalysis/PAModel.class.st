Class {
	#name : #PAModel,
	#superclass : #Object,
	#instVars : [
		'rules',
		'apps',
		'groups',
		'options',
		'paths'
	],
	#category : #ProguardAnalysis
}

{ #category : #adding }
PAModel >> addRule: r [ 
	rules add: r
]

{ #category : #accessing }
PAModel >> apps [
	^ apps
]

{ #category : #building }
PAModel >> build [
	apps := (rules collect: #app) copyWithoutDuplicates collect: [ :a | PAApp new name: a ].
	groups := (rules collect: #group) copyWithoutDuplicates collect: [ :a | PAGroup new name: a ].
	paths := (rules collect: #path) copyWithoutDuplicates collect: [ :a | PAPath new name: a ].
	options := (rules collect: #option) copyWithoutDuplicates collect: [ :a | PAOption new name: a ].
]

{ #category : #accessing }
PAModel >> groups [
	^ groups
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
	rules := OrderedCollection new.
	apps := OrderedCollection new.
	groups := OrderedCollection new.
	options := OrderedCollection new.
	paths := OrderedCollection new
]

{ #category : #'as yet unclassified' }
PAModel >> numberOfRules [
	^ rules size
]

{ #category : #accessing }
PAModel >> options [
	^ options
]

{ #category : #accessing }
PAModel >> paths [
	^ paths
]

{ #category : #initialization }
PAModel >> rules [
	^ rules
]
