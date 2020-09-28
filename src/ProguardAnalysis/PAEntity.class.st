Class {
	#name : #PAEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'entities'
	],
	#category : #ProguardAnalysis
}

{ #category : #adding }
PAEntity >> addOutgoingAll: someEntities [
	entities addAll: someEntities
]

{ #category : #'as yet unclassified' }
PAEntity >> apps [
	^ entities select: #isApp
]

{ #category : #'as yet unclassified' }
PAEntity >> coOptionsFromApp [
	^ (self apps flatCollect: #options) copyWithoutDuplicates
]

{ #category : #'as yet unclassified' }
PAEntity >> coOptionsFromAppWithOccurences [
	| r |
	r := (self apps flatCollect: #options) groupedBy: #yourself.
	^ r associations collect: [ :as | as key -> as value size ]
]

{ #category : #'as yet unclassified' }
PAEntity >> coOptionsFromAppWithOccurencesHigherThan: threshold [
	^ (self coOptionsFromAppWithOccurences select: [ :as | as value >= threshold ]) collect: #key
]

{ #category : #'as yet unclassified' }
PAEntity >> groups [
	^ entities select: #isGroup
]

{ #category : #initialization }
PAEntity >> initialize [
	entities := OrderedCollection new
]

{ #category : #testing }
PAEntity >> isApp [
	^ false
]

{ #category : #testing }
PAEntity >> isGroup [
	^ false
]

{ #category : #testing }
PAEntity >> isOption [
	^ false
]

{ #category : #testing }
PAEntity >> isPath [
	^ false
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
PAEntity >> options [
	^ entities select: #isOption
]

{ #category : #'as yet unclassified' }
PAEntity >> paths [
	^ entities select: #isPath
]

{ #category : #printing }
PAEntity >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	(name notNil and: [ name notEmpty ]) ifTrue: [
		str nextPutAll: name ].
	str nextPut: $>.
]
