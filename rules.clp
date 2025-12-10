(deftemplate question
(slot id (type SYMBOL))
(slot text (type STRING))
(multislot answers (type STRING))
)

(deftemplate answer
(slot id (type SYMBOL))
(slot value (type STRING))
)	


(deftemplate result
(slot text (type STRING))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule start
=>
(assert (question 
	(id q-love-money)
	(text "Do you love money?")
	(answers "Yes" "No")
)))

(defrule q-love-money-yes
    (answer (id q-love-money) (value "Yes"))
    =>
    (assert (question 
        (id q-productive-work)
        (text "Do you like doing productive work?")
        (answers "Yes" "No")
    )
))

(defrule q-productive-work-yes
    (answer (id q-productive-work) (value "Yes"))
    =>
    (assert (question 
        (id q-code)
        (text "Can you code?")
        (answers "Yes" "No" "Well... it's been a while")
    )
))

(defrule q-productive-work-no
    (answer (id q-productive-work) (value "No"))
    =>
    (assert (question
        (id q-afraid-responsibility)
        (text "Are you afraid of responsibility?")
        (answers "Yes" "No")
    )
))

(defrule q-afraid-responsibility-yes
    (answer (id q-afraid-responsibility) (value "Yes"))
    =>
    (assert (result (text "Consultant")))
)

(defrule q-afraid-responsibility-no
    (answer (id q-afraid-responsibility) (value "No"))
    =>
    (assert (question
        (id q-grand-vision)
        (text "Do you have a 'grand vision'?")
        (answers "Yes" "No")
    )
))

(defrule q-grand-vision-yes
    (answer (id q-grand-vision) (value "Yes"))
    =>
    (assert (result (text "Creative Director")))
)

(defrule q-grand-vision-no
    (answer (id q-grand-vision) (value "No"))
    =>
    (assert (question
        (id q-any-money)
        (text "Do you have any money?")
        (answers "Yes" "No")
    )
))


(defrule q-any-money-yes
    (answer (id q-any-money) (value "Yes"))
    =>
    (assert (question
        (id q-conscience)
        (text "Do you have a conscience?")
        (answers "Yes" "No")
    )
))

(defrule q-any-money-no
    (answer (id q-any-money) (value "No"))
    =>
    (assert (result (text "Producer")))
)

(defrule q-conscience-yes
    (answer (id q-conscience) (value "Yes"))
    =>
    (assert (result (text "Studio Head")))
)

(defrule q-conscience-no
    (answer (id q-conscience) (value "No"))
    =>
    (assert (result (text "Social Games Studio Head")))
)

(defrule q-code-yes
    (answer (id q-code) (value "Yes"))
    =>
    (assert (result (text "Programmer")))
)

(defrule q-code-well
    (answer (id q-code) (value "Well... it's been a while"))
    =>
    (assert (result (text "Technical Lead")))
)

(defrule q-code-no
    (answer (id q-code) (value "No"))
    =>
    (assert (result (text "You're shit out of luck")))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule q-love-money-no
    (answer (id q-love-money) (value "No"))
    =>
    (assert (question
        (id q-exceptional-talent)
        (text "Do you have exceptional talent?")
        (answers "Yes" "No")
    )
))

(defrule q-exceptional-talent-yes
    (answer (id q-exceptional-talent) (value "Yes"))
    =>
    (assert (question
        (id q-excited-other-peoples-ideas)
        (text "Can you get excited for other peoples' ideas?")
        (answers "Yes" "No" "Nah, but I can fake it")
    )
))

(defrule q-exceptional-talent-no
    (answer (id q-exceptional-talent) (value "No"))
    =>
    (assert (question
        (id q-bitter)
        (text "Are you bitter about it?")
        (answers "Yes" "No")
    )
))

(defrule q-bitter-yes
    (answer (id q-bitter) (value "Yes"))
    =>
    (assert (result (text "Game Critic")))
)

(defrule q-bitter-no
    (answer (id q-bitter) (value "No"))
    =>
    (assert (result (text "Game Reviewer")))
)

(defrule q-excited-other-peoples-ideas-yes
    (answer (id q-excited-other-peoples-ideas) (value "Yes"))
    =>
    (assert (question
        (id q-excited-really)
        (text "Really?")
        (answers "Yes" "No")
    )
))

(defrule q-excited-really-yes
    (answer (id q-excited-really) (value "Yes"))
        =>
        (assert (question
            (id q-underappreciated)
            (text "Do you mind being underappreciated?")
            (answers "Yes" "No")
        )
))

(defrule q-excited-really-no
    (answer (id q-excited-really) (value "No"))
        =>
        (assert (question
            (id q-games-important)
            (text "Do you think games are important?")
            (answers "Yes" "No")
        )
))

(defrule q-excited-other-peoples-ideas-no
    (answer (id q-excited-other-peoples-ideas) (value "No"))
    =>
    (assert (question
        (id q-games-important)
        (text "Do you think games are important?")
        (answers "Yes" "No")
    )
))

(defrule q-excited-other-peoples-ideas-nah-fake
    (answer (id q-excited-other-peoples-ideas) (value "Nah, but I can fake it"))
    =>
    (assert (result (text "Marketer")))
)

(defrule q-games-important-yes
    (answer (id q-games-important) (value "Yes"))
    =>
    (assert (question
        (id q-games-on-your-own)
        (text "Can you make games on your own?")
        (answers "Yes" "No")
    )
))

(defrule q-games-on-your-own-yes
    (answer (id q-games-on-your-own) (value "Yes"))
    =>
    (assert (result (text "Indie Developer")))
)

(defrule q-games-on-your-own-no
    (answer (id q-games-on-your-own) (value "No"))
    =>
    (assert (question
        (id q-basic-grammar)
        (text "Do you know basic grammar?")
        (answers "Yes" "No")
    )
))

(defrule q-games-important-no
    (answer (id q-games-important) (value "No"))
    =>
    (assert (result (text "Social Games Studio Employee")))
)

(defrule q-basic-grammar-yes
    (answer (id q-basic-grammar) (value "Yes"))
    =>
    (assert (result (text "Blogger")))
)

(defrule q-basic-grammar-no
    (answer (id q-basic-grammar) (value "No"))
    =>
    (assert (question
        (id q-good-playing-games)
        (text "Are you at least good at playing games?")
        (answers "Yes" "No")
    )
))

(defrule q-good-playing-games-yes
    (answer (id q-good-playing-games) (value "Yes"))
    =>
    (assert (question
        (id q-from-asia)
        (text "Are you from Asia?")
        (answers "Yes, Korea" "Yes, China" "No")
    )
))

(defrule q-good-playing-games-no
    (answer (id q-good-playing-games) (value "No"))
    =>
    (assert (result (text "Gamer")))
)

(defrule q-from-asia-yes-korea
    (answer (id q-from-asia) (value "Yes, Korea"))
    =>
    (assert (result (text "Starcraft Cyberathlete")))
)

(defrule q-from-asia-yes-china
    (answer (id q-from-asia) (value "Yes, China"))
    =>
    (assert (result (text "Gold Farmer")))
)

(defrule q-from-asia-no
    (answer (id q-from-asia) (value "No"))
    =>
    (assert (result (text "Gamer")))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule q-underappreciated-yes
    (answer (id q-underappreciated) (value "Yes"))
        =>
    () ;; TODO   
)

(defrule q-underappreciated-no
    (answer (id q-underappreciated) (value "No"))
        =>
    () ;; TODO   
)