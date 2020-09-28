Class {
	#name : #PAEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'outgoing'
	],
	#category : #ProguardAnalysis
}

{ #category : #adding }
PAEntity >> addOutgoingAll: someEntities [
	outgoing addAll: someEntities
]

{ #category : #initialization }
PAEntity >> initialize [
	outgoing := OrderedCollection new
]

{ #category : #accessing }
PAEntity >> name [
	^ name
]

{ #category : #accessing }
PAEntity >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
PAEntity >> outgoingApp [
	^ outgoing collect: #isApp
]

{ #category : #'as yet unclassified' }
PAEntity >> outgoingGroup [
	^ outgoing collect: #isGroup
]

{ #category : #'as yet unclassified' }
PAEntity >> outgoingOptions [
	^ outgoing collect: #isOption
]

{ #category : #'as yet unclassified' }
PAEntity >> outgoingPaths [
	^ outgoing collect: #isPath
]
