global css @root ff:Arial c:white/87 bg:black/85
global css a c:indigo5 c@hover:indigo6
global css body m:0 d:flex ja:center h:100vh

import {Calculator} from './calculator'

tag app
	prop currentDigit = 0
	prop currentDisplay = 0
	prop previousDisplay = " "
	prop currentOperator = " "

	<self>
		<Calculator
			currentDigit=currentDigit
			currentDisplay=currentDisplay
			previousDisplay=previousDisplay
			currentOperator=currentOperator
		>

imba.mount <app>
