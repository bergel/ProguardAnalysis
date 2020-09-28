Class {
	#name : #PARule,
	#superclass : #Object,
	#instVars : [
		'app',
		'path',
		'group',
		'option'
	],
	#category : #ProguardAnalysis
}

{ #category : #accessing }
PARule >> app [
	^ app
]

{ #category : #accessing }
PARule >> app: anObject [
	app := anObject
]

{ #category : #accessing }
PARule >> group [
	^ group
]

{ #category : #accessing }
PARule >> group: anObject [
	group := anObject
]

{ #category : #accessing }
PARule >> option [
	^ option
]

{ #category : #accessing }
PARule >> option: anObject [
	option := anObject
]

{ #category : #accessing }
PARule >> path [
	^ path
]

{ #category : #accessing }
PARule >> path: anObject [
	path := anObject
]
