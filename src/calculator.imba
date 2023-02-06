export tag Calculator
	prop currentDisplay = 0
	prop previousDisplay = 0
	prop currentOperator = ""

	css self
		w:100vw @500:500px
		bgc:gray5
		p:10px
		rd:6px
		button
			fs:1.5em @320:2em @500:3em
			c:white/80 .orange: white
			bgc:black/60 @hover:black/70 @active:black/70 @focus:black/70
			rd:6px
		button.orange
			bgc:orange4 @hover:orange5 @active:orange5 @focus:orange5
		.display-header
			d:rbox
			fs:1em @320:1.5em @500:2em
			g:10px
			c:white/60
			min-height:2em
		.main-display
			d:rbox
			fs:1.5em @320:2em @500:3em
		.keypad
			d:grid
			gt: repeat(5, 10vh) / repeat(4, 1fr)
		.double
			gc:auto / span 2

	def setCurrentDigit digit
		if digit !== "." then currentDisplay = parseFloat("{currentDisplay}{digit}")
		else currentDisplay = "{currentDisplay}{digit}"

	def setOperator operator
		if previousDisplay === 0 and currentDisplay === 0 then return
		if currentOperator !== "" then calculate()
		previousDisplay = currentDisplay
		currentOperator = operator
		currentDisplay = 0

	def calculate
		if currentOperator === "+" then currentDisplay = previousDisplay + currentDisplay
		elif currentOperator === "-" then currentDisplay = previousDisplay - currentDisplay
		elif currentOperator === "×" then currentDisplay = previousDisplay * currentDisplay
		elif currentOperator === "÷" then currentDisplay = previousDisplay / currentDisplay
		clearHeaderDisplay()

	def clearAll
		currentDisplay = 0
		clearHeaderDisplay()

	def removeLastDigit
		let newNumber = currentDisplay.toString()
		newNumber = newNumber.substr(0, newNumber.length - 1)
		if newNumber.length === 0 then newNumber = 0
		currentDisplay = parseFloat(newNumber)

	def calculatePercent
		currentDisplay = (previousDisplay * currentDisplay) / 100
		clearHeaderDisplay()

	def clearHeaderDisplay
		previousDisplay = 0
		currentOperator = ""

	<self>
		<div.display-header>
			<div.previous> if previousDisplay > 0 then previousDisplay
			<div.operator> currentOperator
		<div.main-display> currentDisplay
		<div.keypad>
			<button @click=clearAll> "AC"
			<button @click=removeLastDigit> "DEL"
			<button @click=calculatePercent> "%"
			<button.orange @click=setOperator("÷")> "÷"
			<button @click=setCurrentDigit(7)> "7"
			<button @click=setCurrentDigit(8)> "8"
			<button @click=setCurrentDigit(9)> "9"
			<button.orange @click=setOperator("×")> "×"
			<button @click=setCurrentDigit(4)> "4"
			<button @click=setCurrentDigit(5)> "5"
			<button @click=setCurrentDigit(6)> "6"
			<button.orange @click=setOperator("-")> "-"
			<button @click=setCurrentDigit(1)> "1"
			<button @click=setCurrentDigit(2)> "2"
			<button @click=setCurrentDigit(3)> "3"
			<button.orange @click=setOperator("+")> "+"
			<button.double @click=setCurrentDigit(0)> "0"
			<button @click=setCurrentDigit(".")> "."
			<button.orange @click=calculate> "="
