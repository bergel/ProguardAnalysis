Class {
	#name : #PAModelTest,
	#superclass : #TestCase,
	#instVars : [
		'm'
	],
	#category : #ProguardAnalysis
}

{ #category : #running }
PAModelTest >> setUp [
	super setUp.
	m := PAModel new
]

{ #category : #example }
PAModelTest >> smallDataSet [
	^ 'app,path,group,option
io.github.subhamtyagi.lastlauncher_4,io.github.subhamtyagi.lastlauncher_4_src.tar.gz/app/proguard-rules.pro,preverification,dontpreverify
io.github.subhamtyagi.lastlauncher_4,io.github.subhamtyagi.lastlauncher_4_src.tar.gz/app/proguard-rules.pro,obfuscation,repackageclasses
io.github.subhamtyagi.lastlauncher_4,io.github.subhamtyagi.lastlauncher_4_src.tar.gz/app/proguard-rules.pro,optimization,allowaccessmodification
info.dvkr.screenstream_30302,info.dvkr.screenstream_30302_src.tar.gz/app/proguard-rules.pro,keep,keepnames
info.dvkr.screenstream_30302,info.dvkr.screenstream_30302_src.tar.gz/app/proguard-rules.pro,obfuscation,keepattributes
info.dvkr.screenstream_30302,info.dvkr.screenstream_30302_src.tar.gz/app/proguard-rules.pro,obfuscation,keepattributes
info.dvkr.screenstream_30302,info.dvkr.screenstream_30302_src.tar.gz/app/proguard-rules.pro,keep,keep
info.dvkr.screenstream_30302,info.dvkr.screenstream_30302_src.tar.gz/app/proguard-rules.pro,keep,keep
'
]

{ #category : #tests }
PAModelTest >> testEmpty [
	self assert: m rules size equals: 0
]

{ #category : #tests }
PAModelTest >> testSmallDataSet [
	| g |
	m importFromString: self smallDataSet.
	self assert: m numberOfRules equals: 8.
	self assert: m options size equals: 0.

	m build.
	self assert: m options size equals: 6.	
	self assert: m groups size equals: 4.
	
	g := m groups second.
	self assert: g name equals: 'preverification'.
	self assert: g options first name equals: 'dontpreverify'.
	 

]
