export tag Calculator
	prop currentDisplay = 0
	prop previousDisplay = ""
	prop currentOperator = ""

	css w:500px bgc:gray5 p:10px rd:6px
		button w: 25% h: 10vh fs:3em c:white/80 bgc:black/60 bgc@hover:black/70 bgc@active:black/70 bgc@focus:black/70 rd:6px
		button.double w: 50%
		button.orange bgc:orange4 bgc@hover:orange5 bgc@active:orange5 bgc@focus:orange5 c:white
		.display-header d:rbox fs:2em g:10px c:white/60 min-height:2em
		.main-display d:rbox fs:4em

	def setCurrentDigit digit
		if digit !== "." then currentDisplay = parseFloat("{currentDisplay}{digit}")
		else currentDisplay = "{currentDisplay}{digit}"

	def setOperator operator
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

	def calculatePercent
		currentDisplay = (previousDisplay * currentDisplay) / 100
		clearHeaderDisplay()

	def clearHeaderDisplay
		previousDisplay = ""
		currentOperator = ""

	<self>
		<div>
			<div.display-header>
				<div.previous> previousDisplay
				<div.operator> currentOperator
			<div.main-display> currentDisplay
			<div>
				<button.double @click=clearAll> "AC"
				<button @click=calculatePercent> "%"
				<button.orange @click=setOperator("÷")> "÷"
			<div>
				<button @click=setCurrentDigit(7)> "7"
				<button @click=setCurrentDigit(8)> "8"
				<button @click=setCurrentDigit(9)> "9"
				<button.orange @click=setOperator("×")> "×"
			<div>
				<button @click=setCurrentDigit(4)> "4"
				<button @click=setCurrentDigit(5)> "5"
				<button @click=setCurrentDigit(6)> "6"
				<button.orange @click=setOperator("-")> "-"
			<div>
				<button @click=setCurrentDigit(1)> "1"
				<button @click=setCurrentDigit(2)> "2"
				<button @click=setCurrentDigit(3)> "3"
				<button.orange @click=setOperator("+")> "+"
			<div>
				<button.double @click=setCurrentDigit(0)> "0"
				<button @click=setCurrentDigit(".")> "."
				<button.orange @click=calculate> "="
