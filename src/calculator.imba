
export tag Calculator
	prop currentDigit
	prop currentDisplay
	prop previousDisplay
	prop currentOperator

	css w:500px bgc:gray5 p:10px rd:6px
		button w: 25% h: 10vh fs:3em c:white/80 bgc:black/60 bgc@hover:black/70 bgc@active:black/70 bgc@focus:black/70 rd:6px
		button.double w: 50%
		button.orange bgc:orange4 bgc@hover:orange5 bgc@active:orange5 bgc@focus:orange5 c:white
		.display-header d:rbox fs:2em g:10px c:white/60
		.main-display d:rbox fs:4em

	def setCurrentDigit digit
		if digit !== "."
			currentDisplay = parseFloat("{currentDisplay}{digit}")
		else
			currentDisplay = "{currentDisplay}{digit}"

	<self>
		<div>
			<div.display-header>
				<div.previous> preciousDisplay
				<div.operator> currentOperator
			<div.main-display> currentDisplay
			<div>
				<button.double> "AC"
				<button> "%"
				<button.orange> "÷"
			<div>
				<button @click=setCurrentDigit(7)> "7"
				<button @click=setCurrentDigit(8)> "8"
				<button @click=setCurrentDigit(9)> "9"
				<button.orange> "×"
			<div>
				<button @click=setCurrentDigit(4)> "4"
				<button @click=setCurrentDigit(5)> "5"
				<button @click=setCurrentDigit(6)> "6"
				<button.orange> "-"
			<div>
				<button @click=setCurrentDigit(1)> "1"
				<button @click=setCurrentDigit(2)> "2"
				<button @click=setCurrentDigit(3)> "3"
				<button.orange> "+"
			<div>
				<button.double @click=setCurrentDigit(0)> "0"
				<button @click=setCurrentDigit(".")> "."
				<button.orange> "="
