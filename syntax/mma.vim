if exists("b:current_syntax")
    finish
endif


let b:current_syntax = "mma"
syntax case ignore
syntax keyword mmaKeyword Chords Lyric Tempo
syntax match mmaComment "\v\/\/.*$" containedin=block
syntax match mmaOperator "\v\="
syntax match mmaOperator "\v\+"
syntax match sequence '\i\+' contained
syntax keyword mmaTrack Drum Chord Arpeggio Scale Bass Walk Solo Melody containedin=block
syntax keyword mmaNtCommands AdjustVolume AllTracks Author AutoSoloTracks BarNumbers BarRepeat BeatAdjust 
			\ ChordAdjust Comment Debug Dec DefChord DefGroove Doc DrumTR DrumVolTr EndIf EndMset End EndIf EndMset EndRepeat Eof Fermata  
			\ Goto Groove If IfEnd Inc Include
			\ KeySig Label Lyric MIDI MidiFile MIDIMark MIDISplit
			\ MmaEnd MmaStart Mset MsetEnd
			\ Print PrintActive PrintChord Repeat RepeatEnd RepeatEnding
			\ RndSeed RndSet
			\ Seq SeqSize Set SetAutoLibPath SetIncPath SetLibPath
			\ SetOutPath
			\ ShowVars StackValue SwingMode Tempo
			\ Time TimeSig Transpose UnSet Use VExpand VoiceTr
			\ VoiceVolTr
"syntax clear Begin
"syntax clear End
syntax keyword mmaNtLimits Begin contained
syntax keyword mmaNtLimits End contained

syntax region block start='Begin' end='End' contains=defblock, mmaNtLimits, sequence
"syntax region block matchgroup=Limits start='Begin' end='End' contains=defblock
"syntax region defblock matchgroup=Limits start='Define' end='End' contains=sequence
syntax keyword mmaTrackCommands Accent Articulate ChShare Channel ChannelPref Compress Copy Debug 
			\ Delete Direction DrumType DupRoot ForceOut Harmony HarmonyOnly HarmonyVolume Invert Limit
			\ MIDIClear MIDIGliss MIDIInc MIDIPan MIDISeq MIDITName MidiVoice MidiVolume Mallet NoteSpan Octave Off On
			\ RSkip RTime RVolume Range Riff ScaleType Sequence Strum Tone Voice Voicing containedin=block nextgroup=value skipwhite
syntax match value '\i\+' contained
hi value ctermfg=darkblue
hi Limits ctermfg=darkblue
"try to match all text on nl within block
"syntax keyword Define containedin=block nextgroup=sequence
syntax keyword mmaCommands Cresc Cut Decresc SeqClear SeqRnd SeqRndWeight Unify Volume
syntax keyword mmaFunction Groove 


highlight link block String
highlight link mmaComment Comment
highlight link mmaKeyword Keyword
highlight link mmaFunction Function
highlight link mmaOperator Operator
highlight link mmaTrack Identifier
highlight link mmaNtCommands Keyword
highlight link mmaTrackCommands Underlined
highlight link mmaCommands Statement
