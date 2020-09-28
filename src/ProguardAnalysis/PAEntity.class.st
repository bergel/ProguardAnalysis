Class {
	#name : #PAEntity,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #ProguardAnalysis
}

{ #category : #accessing }
PAEntity >> name [
	^ name
]

{ #category : #accessing }
PAEntity >> name: anObject [
	name := anObject
]
