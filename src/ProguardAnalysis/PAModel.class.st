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

{ #category : #'private - building' }
PAModel >> build [
	| a p g o |
	apps := (rules collect: #app) copyWithoutDuplicates collect: [ :aa | PAApp new name: aa ].
	groups := (rules collect: #group) copyWithoutDuplicates collect: [ :aa | PAGroup new name: aa ].
	paths := (rules collect: #path) copyWithoutDuplicates collect: [ :aa | PAPath new name: aa ].
	options := (rules collect: #option) copyWithoutDuplicates collect: [ :aa | PAOption new name: aa ].
	
	rules do: [ :r |
		a := self entityIn: apps  named: r app.
		p := self entityIn: paths  named: r path.
		g := self entityIn: groups  named: r group.
		o := self entityIn: options  named: r option.
		
		a addOutgoingAll: { p . g . o }.
		p addOutgoingAll: { a . g . o }.
		g addOutgoingAll: { p . a . o }.
		o addOutgoingAll: { p . g . a }.
	]
]

{ #category : #'private - building' }
PAModel >> entityIn: coll named: aName [
	^ coll detect: [ :a | a name = aName ]
]

{ #category : #accessing }
PAModel >> groups [
	^ groups
]

{ #category : #visualization }
PAModel >> gtInspectorOptionsIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Option Cooccurence/App';
		initializeCanvas: [ 
			self visualizeOptionCooccurenceApp ]
]

{ #category : #visualization }
PAModel >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'Simple App';
		initializeCanvas: [ 
			self visualizeSimpleApp ]
]

{ #category : #public }
PAModel >> importFilename: filename [
	| fr rs |
	fr := filename asFileReference.
	rs := fr readStream.
	 
	self importFromString: rs contents
]

{ #category : #public }
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

{ #category : #public }
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

{ #category : #visualization }
PAModel >> visualizeOptionCooccurenceApp [

	| m |
	m := RSMondrian new.
	m nodes: self options.
	m line connectToAll: [ :o | 
		o coOptionsFromAppWithOccurencesHigherThan: 800 ].
	m layout force.
	m build.
	^ m canvas
]

{ #category : #visualization }
PAModel >> visualizeSimple [

	| m |
	m := RSMondrian new.
	m nodes: self apps forEach: [ :a | 
		m shape box
			color: Color blue;
			size: 5.
		m nodes: a options asSet ].
	m build.
	^ m canvas
]

{ #category : #visualization }
PAModel >> visualizeSimpleApp [

	| m |
	m := RSMondrian new.
	m nodes: self apps forEach: [ :a | 
		m shape box
			color: Color blue;
			size: 5.
		m nodes: a options asSet ].
	m build.
	^ m canvas
]
