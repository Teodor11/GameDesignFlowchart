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
    (not (question (id q-love-money)))
    (not (answer (id q-love-money) (value ?)))
=>
    (assert (question 
        (id q-love-money)
        (text "Do you love money?")
        (answers "Yes" "No")
    ))
)

(defrule q-love-money-yes
    (answer (id q-love-money) (value "Yes"))
    (not (answer (id q-productive-work) (value ?)))
    (not (question (id q-productive-work)))
    =>
    (assert (question 
        (id q-productive-work)
        (text "Do you like doing productive work?")
        (answers "Yes" "No")
    )
))

(defrule q-productive-work-yes
    (answer (id q-productive-work) (value "Yes"))
    (not (answer (id q-code) (value ?)))
    (not (question (id q-code)))
    =>
    (assert (question 
        (id q-code)
        (text "Can you code?")
        (answers "Yes" "No" "Well... it's been a while")
    )
))

(defrule q-productive-work-no
    (answer (id q-productive-work) (value "No"))
    (not (answer (id q-afraid-responsibility) (value ?)))
    (not (question (id q-afraid-responsibility)))
    =>
    (assert (question
        (id q-afraid-responsibility)
        (text "Are you afraid of responsibility?")
        (answers "Yes" "No")
    )
))

(defrule q-afraid-responsibility-yes
    (answer (id q-afraid-responsibility) (value "Yes"))
    (not (result (text ?)))
    =>
    (assert (result (text "Consultant")))
)

(defrule q-afraid-responsibility-no
    (answer (id q-afraid-responsibility) (value "No"))
    (not (answer (id q-grand-vision) (value ?)))
    (not (question (id q-grand-vision)))
    =>
    (assert (question
        (id q-grand-vision)
        (text "Do you have a 'grand vision'?")
        (answers "Yes" "No")
    )
))

(defrule q-grand-vision-yes
    (answer (id q-grand-vision) (value "Yes"))
    (not (result (text ?)))
    =>
    (assert (result (text "Creative Director")))
)

(defrule q-grand-vision-no
    (answer (id q-grand-vision) (value "No"))
    (not (answer (id q-any-money) (value ?)))
    (not (question (id q-any-money)))
    =>
    (assert (question
        (id q-any-money)
        (text "Do you have any money?")
        (answers "Yes" "No")
    )
))


(defrule q-any-money-yes
    (answer (id q-any-money) (value "Yes"))
    (not (answer (id q-conscience) (value ?)))
    (not (question (id q-conscience)))
    =>
    (assert (question
        (id q-conscience)
        (text "Do you have a conscience?")
        (answers "Yes" "No")
    )
))

(defrule q-any-money-no
    (answer (id q-any-money) (value "No"))
    (not (result (text ?)))
    =>
    (assert (result (text "Producer")))
)

(defrule q-conscience-yes
    (answer (id q-conscience) (value "Yes"))
    (not (result (text ?)))
    =>
    (assert (result (text "Studio Head")))
)

(defrule q-conscience-no
    (answer (id q-conscience) (value "No"))
    (not (result (text ?)))
    =>
    (assert (result (text "Social Games Studio Head")))
)

(defrule q-code-yes
    (answer (id q-code) (value "Yes"))
    (not (result (text ?)))
    =>
    (assert (result (text "Programmer")))
)

(defrule q-code-well
    (answer (id q-code) (value "Well... it's been a while"))
    (not (result (text ?)))
    =>
    (assert (result (text "Technical Lead")))
)

(defrule q-code-no
    (answer (id q-code) (value "No"))
    (not (result (text ?)))
    =>
    (assert (result (text "You're shit out of luck")))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule q-love-money-no
    (answer (id q-love-money) (value "No"))
    (not (answer (id q-exceptional-talent) (value ?)))
    (not (question (id q-exceptional-talent)))
    =>
    (assert (question
        (id q-exceptional-talent)
        (text "Do you have exceptional talent?")
        (answers "Yes" "No")
    )
))

(defrule q-exceptional-talent-yes
    (answer (id q-exceptional-talent) (value "Yes"))
    (not (answer (id q-excited-other-peoples-ideas) (value ?)))
    (not (question (id q-excited-other-peoples-ideas)))
    =>
    (assert (question
        (id q-excited-other-peoples-ideas)
        (text "Can you get excited for other peoples' ideas?")
        (answers "Yes" "No" "Nah, but I can fake it")
    )
))

(defrule q-exceptional-talent-no
    (answer (id q-exceptional-talent) (value "No"))
    (not (answer (id q-bitter) (value ?)))
    (not (question (id q-bitter)))
    =>
    (assert (question
        (id q-bitter)
        (text "Are you bitter about it?")
        (answers "Yes" "No")
    )
))

(defrule q-bitter-yes
    (answer (id q-bitter) (value "Yes"))
    (not (result (text ?)))
    =>
    (assert (result (text "Game Critic")))
)

(defrule q-bitter-no
    (answer (id q-bitter) (value "No"))
    (not (result (text ?)))
    =>
    (assert (result (text "Game Reviewer")))
)

(defrule q-excited-other-peoples-ideas-yes
    (answer (id q-excited-other-peoples-ideas) (value "Yes"))
    (not (answer (id q-excited-really) (value ?)))
    (not (question (id q-excited-really)))
    =>
    (assert (question
        (id q-excited-really)
        (text "Really?")
        (answers "Yes" "No")
    )
))

(defrule q-excited-really-yes
    (answer (id q-excited-really) (value "Yes"))
    (not (answer (id q-underappreciated) (value ?)))
    (not (question (id q-underappreciated)))
        =>
        (assert (question
            (id q-underappreciated)
            (text "Do you mind being underappreciated?")
            (answers "Yes" "No")
        )
))

(defrule q-excited-really-no
    (answer (id q-excited-really) (value "No"))
    (not (answer (id q-games-important) (value ?)))
    (not (question (id q-games-important)))
        =>
        (assert (question
            (id q-games-important)
            (text "Do you think games are important?")
            (answers "Yes" "No")
        )
))

(defrule q-excited-other-peoples-ideas-no
    (answer (id q-excited-other-peoples-ideas) (value "No"))
    (not (answer (id q-games-important) (value ?)))
    (not (question (id q-games-important)))
    =>
    (assert (question
        (id q-games-important)
        (text "Do you think games are important?")
        (answers "Yes" "No")
    )
))

(defrule q-excited-other-peoples-ideas-nah-fake
    (answer (id q-excited-other-peoples-ideas) (value "Nah, but I can fake it"))
    (not (result (text ?)))
    =>
    (assert (result (text "Marketer")))
)

(defrule q-games-important-yes
    (answer (id q-games-important) (value "Yes"))
    (not (answer (id q-games-on-your-own) (value ?)))
    (not (question (id q-games-on-your-own)))
    =>
    (assert (question
        (id q-games-on-your-own)
        (text "Can you make games on your own?")
        (answers "Yes" "No")
    )
))

(defrule q-games-on-your-own-yes
    (answer (id q-games-on-your-own) (value "Yes"))
    (not (result (text ?)))
    =>
    (assert (result (text "Indie Developer")))
)

(defrule q-games-on-your-own-no
    (answer (id q-games-on-your-own) (value "No"))
    (not (answer (id q-basic-grammar) (value ?)))
    (not (question (id q-basic-grammar)))
    =>
    (assert (question
        (id q-basic-grammar)
        (text "Do you know basic grammar?")
        (answers "Yes" "No")
    )
))

(defrule q-games-important-no
    (answer (id q-games-important) (value "No"))
    (not (result (text ?)))
    =>
    (assert (result (text "Social Games Studio Employee")))
)

(defrule q-basic-grammar-yes
    (answer (id q-basic-grammar) (value "Yes"))
    (not (result (text ?)))
    =>
    (assert (result (text "Blogger")))
)

(defrule q-basic-grammar-no
    (answer (id q-basic-grammar) (value "No"))
    (not (answer (id q-good-playing-games) (value ?)))
    (not (question (id q-good-playing-games)))
    =>
    (assert (question
        (id q-good-playing-games)
        (text "Are you at least good at playing games?")
        (answers "Yes" "No")
    )
))

(defrule q-good-playing-games-yes
    (answer (id q-good-playing-games) (value "Yes"))
    (not (answer (id q-from-asia) (value ?)))
    (not (question (id q-from-asia)))
    =>
    (assert (question
        (id q-from-asia)
        (text "Are you from Asia?")
        (answers "Yes, Korea" "Yes, China" "No")
    )
))

(defrule q-good-playing-games-no
    (answer (id q-good-playing-games) (value "No"))
    (not (result (text ?)))
    =>
    (assert (result (text "Gamer")))
)

(defrule q-from-asia-yes-korea
    (answer (id q-from-asia) (value "Yes, Korea"))
    (not (result (text ?)))
    =>
    (assert (result (text "Starcraft Cyberathlete")))
)

(defrule q-from-asia-yes-china
    (answer (id q-from-asia) (value "Yes, China"))
    (not (result (text ?)))
    =>
    (assert (result (text "Gold Farmer")))
)

(defrule q-from-asia-no
    (answer (id q-from-asia) (value "No"))
    (not (result (text ?)))
    =>
    (assert (result (text "Gamer")))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule q-underappreciated-yes
    (answer (id q-underappreciated) (value "Yes"))
    (not (answer (id q-visually-oriented) (value ?)))
    (not (question (id q-visually-oriented)))
    =>
    (assert(question
        (id q-visually-oriented)
        (text "Are you visually oriented?")
        (answers "Yes" "No")
    ))
)

(defrule q-underappreciated-no
    (answer (id q-underappreciated) (value "No"))
    (not (answer (id q-being-alone) (value ?)))
    (not (question (id q-being-alone)))
        =>
    (assert(question
        (id q-being-alone)
        (text "Do you like being alone?")
        (answers "Yes" "No")
    ))
)

(defrule q-visually-oriented-yes
    (answer (id q-visually-oriented) (value "Yes"))
    (not (answer (id q-working-over-talking) (value ?)))
    (not (question (id q-working-over-talking)))
        =>
    (assert(question
        (id q-working-over-talking)
        (text "Do you prefer working over talking?")
        (answers "Yes" "No")
    ))
)

(defrule q-visually-oriented-no
    (answer (id q-visually-oriented) (value "No"))
    (not (answer (id q-work-unfinished-tools) (value ?)))
    (not (question (id q-work-unfinished-tools)))
        =>
    (assert(question
        (id q-work-unfinished-tools)
        (text "Do you like to work with unfinished tools?")
        (answers "Yes" "No")
    ))
)

(defrule q-being-alone-yes
    (answer (id q-being-alone) (value "Yes"))
    (not (answer (id q-musical) (value ?)))
    (not (question (id q-musical)))
        =>
    (assert(question
        (id q-musical)
        (text "Are you musical?")
        (answers "Yes" "No")
    ))
)

(defrule q-being-alone-no
    (answer (id q-being-alone) (value "No"))
    (not (answer (id q-be-in-movies) (value ?)))
    (not (question (id q-be-in-movies)))
        =>
    (assert(question
        (id q-be-in-movies)
        (text "Would you rather be in movies?")
        (answers "Yes" "No")
    ))
)

(defrule q-working-over-talking-yes
    (answer (id q-working-over-talking) (value "Yes"))
    (not (answer (id q-proper-artist) (value ?)))
    (not (question (id q-proper-artist)))
        =>
    (assert(question
        (id q-proper-artist)
        (text "Would you rather be a \"proper\" artist?")
        (answers "Yes" "No")
    ))
)

(defrule q-working-over-talking-no
    (answer (id q-working-over-talking) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Art Director")))
)

(defrule q-french-yes
    (answer (id q-french) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Comic Artist")))
)

(defrule q-french-no
    (answer (id q-french) (value "No"))
    (not (answer (id q-asian) (value ?)))
    (not (question (id q-asian)))
        =>
    (assert(question
        (id q-asian)
        (text "Asian?")
        (answers "Yes" "No")
    ))
)

(defrule q-asian-yes
    (answer (id q-asian) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Concept Artist")))
)

(defrule q-asian-no
    (answer (id q-asian) (value "No"))
    (not (answer (id q-enjoy-crafting-crates) (value ?)))
    (not (question (id q-enjoy-crafting-crates)))
        =>
    (assert(question
        (id q-enjoy-crafting-crates)
        (text "Do you enjoy crafting crates?")
        (answers "Yes" "No")
    ))
)

(defrule q-enjoy-crafting-crates-yes
    (answer (id q-enjoy-crafting-crates) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Environmental Artist")))
)

(defrule q-enjoy-crafting-crates-no
    (answer (id q-enjoy-crafting-crates) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "2d Artist")))
)

(defrule q-work-unfinished-tools-yes
    (answer (id q-work-unfinished-tools) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Level Designer")))
)

(defrule q-work-unfinished-tools-no
    (answer (id q-work-unfinished-tools) (value "No"))
    (not (answer (id q-spreadsheet) (value ?)))
    (not (question (id q-spreadsheet)))
        =>
    (assert(question
        (id q-spreadsheet)
        (text "Do you speak Spreadsheet?")
        (answers "Yes" "No")
    ))
)

(defrule q-proper-artist-yes
    (answer (id q-proper-artist) (value "Yes"))
    (not (answer (id q-french) (value ?)))
    (not (question (id q-french)))
        =>
    (assert(question
        (id q-french)
        (text "Are you French?")
        (answers "Yes" "No")
    ))
)

(defrule q-proper-artist-no
    (answer (id q-proper-artist) (value "No"))
    (not (answer (id q-2weeks-2seconds) (value ?)))
    (not (question (id q-2weeks-2seconds)))
        =>
    (assert(question
        (id q-2weeks-2seconds)
        (text "Want to to spend two weeks on two seconds?")
        (answers "Yes" "No")
    ))
)

(defrule q-spreadsheet-yes
    (answer (id q-spreadsheet) (value "Yes"))
    (not (answer (id q-told-what-to-do) (value ?)))
    (not (question (id q-told-what-to-do)))
        =>
    (assert(question
        (id q-told-what-to-do)
        (text "Do you want to be told what to do?")
        (answers "Yes" "No")
    ))
)

(defrule q-spreadsheet-no
    (answer (id q-spreadsheet) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Writer")))
)

(defrule q-told-what-to-do-yes
    (answer (id q-told-what-to-do) (value "Yes"))
    (not (answer (id q-obses-details) (value ?)))
    (not (question (id q-obses-details)))
        =>
    (assert(question
        (id q-obses-details)
        (text "Do you obsess excessively over even tiniest details?")
        (answers "Yes" "No")
    ))
)

(defrule q-told-what-to-do-no
    (answer (id q-told-what-to-do) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Lead Game Designer")))
)

(defrule q-2weeks-2seconds-yes
    (answer (id q-2weeks-2seconds) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Animator")))
)

(defrule q-2weeks-2seconds-no
    (answer (id q-2weeks-2seconds) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "3d Artist")))
)

(defrule q-musical-yes
    (answer (id q-musical) (value "Yes"))
    (not (answer (id q-shoot-blow) (value ?)))
    (not (question (id q-shoot-blow)))
        =>
    (assert(question
        (id q-shoot-blow)
        (text "Do you like to shoot or blow things up?")
        (answers "Yes" "No")
    ))
)

(defrule q-musical-no
    (answer (id q-musical) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Office IT")))
)

(defrule q-obses-details-yes
    (answer (id q-obses-details) (value "Yes"))
    (not (answer (id q-gore-blood) (value ?)))
    (not (question (id q-gore-blood)))
        =>
    (assert(question
        (id q-gore-blood)
        (text "Do you have a fixation on gore and blood?")
        (answers "Yes" "No")
    ))
)

(defrule q-obses-details-no
    (answer (id q-obses-details) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Event Scripter")))
)

(defrule q-be-in-movies-yes
    (answer (id q-be-in-movies) (value "Yes"))
    (not (answer (id q-celebrity) (value ?)))
    (not (question (id q-celebrity)))
        =>
    (assert(question
        (id q-celebrity)
        (text "You a TV or movie celebrity?")
        (answers "Yes" "No")
    ))
)

(defrule q-be-in-movies-no
    (answer (id q-be-in-movies) (value "No"))
    (not (answer (id q-mind-error) (value ?)))
    (not (question (id q-mind-error)))
        =>
    (assert(question
        (id q-mind-error)
        (text "Do you mind the errors in this graph?")
        (answers "Yes" "No")
    ))
)

(defrule q-shoot-blow-yes
    (answer (id q-shoot-blow) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Sound Designer")))
)

(defrule q-shoot-blow-no
    (answer (id q-shoot-blow) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Composer")))
)

(defrule q-gore-blood-yes
    (answer (id q-gore-blood) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Combat Designer")))
)

(defrule q-gore-blood-no
    (answer (id q-gore-blood) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Game Designer")))
)

(defrule q-celebrity-yes
    (answer (id q-celebrity) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Voice Actor")))
)

(defrule q-celebrity-no
    (answer (id q-celebrity) (value "No"))
    (not (answer (id q-caussian-hot) (value ?)))
    (not (question (id q-caussian-hot)))
        =>
    (assert(question
        (id q-caussian-hot)
        (text "Are you young caucasian and hot?")
        (answers "Yes" "No")
    ))
)

(defrule q-caussian-hot-yes
    (answer (id q-caussian-hot) (value "Yes"))
    (not (answer (id q-male) (value ?)))
    (not (question (id q-male)))
        =>
    (assert(question
        (id q-male)
        (text "Are you male?")
        (answers "Yes" "No")
    ))
)

(defrule q-caussian-hot-no
    (answer (id q-caussian-hot) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Motion Capture Actor")))
)

(defrule q-male-yes
    (answer (id q-male) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Military Shooter Packaging Model")))
)

(defrule q-male-no
    (answer (id q-male) (value "No"))
    (not (answer (id q-arts-and-crafts) (value ?)))
    (not (question (id q-arts-and-crafts)))
        =>
    (assert(question
        (id q-arts-and-crafts)
        (text "Do you like arts and crafts?")
        (answers "Yes" "No")
    ))
)

(defrule q-arts-and-crafts-yes
    (answer (id q-arts-and-crafts) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Cosplayer")))
)

(defrule q-arts-and-crafts-no
    (answer (id q-arts-and-crafts) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Booth Babe")))
)

(defrule q-mind-error-yes
    (answer (id q-mind-error) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Quality Assurance")))
)

(defrule q-mind-error-no
    (answer (id q-mind-error) (value "No"))
    (not (answer (id q-choice-of-friends) (value ?)))
    (not (question (id q-choice-of-friends)))
        =>
    (assert(question
        (id q-choice-of-friends)
        (text "Do you want to chose who to hang out with?")
        (answers "Yes" "No")
    ))
)

(defrule q-choice-of-friends-yes
    (answer (id q-choice-of-friends) (value "Yes"))
    (not (result (text ?)))
        =>
    (assert (result (text "Guild Leader")))
)

(defrule q-choice-of-friends-no
    (answer (id q-choice-of-friends) (value "No"))
    (not (result (text ?)))
        =>
    (assert (result (text "Comunity Menager")))
)