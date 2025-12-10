(deftemplate question
(slot id (type SYMBOL))
(slot text (type STRING))
(multislot answers (type SYMBOL))
)

(deftemplate answer
(slot id (type SYMBOL))
(slot value (type SYMBOL))
)	


(deftemplate result
(slot text (type STRING))
)


(defrule start
=>
(assert (question 
	(id q-money)
	(text "Do you love money?")
	(answers yes no)
)))

(defrule q-money-yes
?a <- (answer (id q-money) (value yes))
=>
(assert (question 
    (id q-productive-work)
    (text "Do you like doing productive work?")
    (answers yes no)
)))

(defrule q-money-no
?a <- (answer (id q-money) (value no))
=>
(assert (result 
    (text "OK-finish")
)))