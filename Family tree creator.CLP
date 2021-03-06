         CLIPS (V6.24 06/15/06)
CLIPS> (deftemplate father-of (slot father) (slot child))
CLIPS> (deftemplate mother-of (slot mother) (slot child))
CLIPS> (deftemplate sister-of (slot sister) (slot sibling))
CLIPS> (deftemplate brother-of (slot brother) (slot sibling))
CLIPS>  
(deftemplate aunt-of (slot mother) (slot nephew-or-niece))
CLIPS> (deftemplate uncle-of (slot mother) (slot nephew-or-niece))
CLIPS> (deftemplate cousin-of (slot cousin-1)(slot cousin-2))
CLIPS> (deftemplate grandmother-of (slot grandmother) (slot grandchild))
CLIPS> (deftemplate grandfather-of (slot grandfather) (slot grandchild)) 
CLIPS> (deftemplate wife-of (slot wife) (slot husband))
CLIPS> (deftemplate husband-of (slot husband) (slot wife))
CLIPS> (deftemplate ancestor-of (slot ancestor) (slot person))
CLIPS> (deftemplate male (slot person))
CLIPS> (deftemplate female (slot person))
CLIPS> (deffacts info 
(father-of(father "Virgil Simpson")(child "Abraham I")) 
(male(person "Virgil Simpson")) 
(male(person "Abraham I")) 
(mother-of(mother "Mabel Simpson")(child "Abraham I")) 
(female(person "Mabel Simpson")) 
(female(person "Eliza")) 
(father-of(father "Unknown I")(child "Eliza")) 
(male(person "Unknown I")) 
(mother-of(mother "Mabel Simpson")(child "Eliza")) 
(father-of(father "Abraham I")(child "Hugo")) 
(father-of(father "Abraham I")(child "Old Tut")) 
(mother-of(mother "Unknown II")(child "Old Tut")) 
(mother-of(mother "Unknown II")(child "Hugo")) 
(male(person "Old Tut")) 
(male(person "Hugo")) 
(female(person "Unknown II")) 
(father-of(father "Old Tut")(child "Orville")) 
(mother-of(mother "Unknown III")(child "Orville")) 
(female(person "Unknown III")) 
(male(person "Orville")) 
(father-of(father "Orville")(child "Chet")) 
(male(person "Chet")) 
(father-of(father "Orville")(child "Hortense")) 
(female(person "Hortense")) 
(father-of(father "Orville")(child "Cyrus")) 
(male(person "Cyrus")) 
(father-of(father "Orville")(child "Tyrone")) 
(male(person "Tyrone")) 
(father-of(father "Orville")(child "Abraham II")) 
(male(person "Abraham II")) 
(mother-of(mother "Unknown IV")(child "Chet")) 
(mother-of(mother "Unknown IV")(child "Hortense")) 
(mother-of(mother "Unknown IV")(child "Cyrus")) 
(mother-of(mother "Unknown IV")(child "Tyrone")) 
(mother-of(mother "Unknown IV")(child "Abraham II")) 
(female(person "Unknown IV")) 
(father-of(father "Abraham II")(child "Herbert")) 
(male(person "Herbert")) 
(father-of(father "Abraham II")(child "Abbey")) 
(female(person "Abbey")) 
(father-of(father "Abraham II")(child "Homer")) 
(male(person "Homer")) 
(mother-of(mother "Mona Olsen")(child "Homer")) 
(father-of(father "Clancy Bouvier")(child "Marge Bouvier")) 
(male(person "Clancy Bouvier")) 
(female(person "Marge Bouvier")) 
(father-of(father "Clancy Bouvier")(child "Selma")) 
(female(person "Selma")) 
(father-of(father "Clancy Bouvier")(child "Patty")) 
(female(person "Patty")) 
(mother-of(mother "Jacqueline Gurney")(child "Marge Bouvier")) 
(female(person "Jacqueline Gurney")) 
(mother-of(mother "Jacqueline Gurney")(child "Selma")) 
(mother-of(mother "Jacqueline Gurney")(child "Patty")) 
(father-of(father "Homer")(child "Maggie")) 
(female(person "Maggie")) 
(father-of(father "Homer")(child "Lisa")) 
(female(person "Lisa")) 
(father-of(father "Homer")(child "Bart")) 
(male(person "Bart")) 
(mother-of(mother "Marge Bouvier")(child "Maggie")) 
(mother-of(mother "Marge Bouvier")(child "Lisa")) 
(mother-of(mother "Marge Bouvier")(child "Bart")))
CLIPS> (reset)
CLIPS> (defrule sister-of 
   (or (male (person ?person)) 
       (female (person ?person))) 
   (female (person ?sister&~?person)) 
   (father-of (father ?father) (child ?person)) 
   (father-of (father ?father) (child ?sister)) 
   (mother-of (mother ?mother) (child ?person)) 
   (mother-of (mother ?mother) (child ?sister)) 
   => 
(assert(sister-of(sister ?sister)(sibling ?person)))



)
CLIPS> (defrule brother-of 
   (or (male (person ?person)) 
       (female (person ?person))) 
   (male (person ?brother&~?person)) 
   (father-of (father ?father) (child ?person)) 
   (father-of (father ?father) (child ?brother)) 
   (mother-of (mother ?mother) (child ?person)) 
   (mother-of (mother ?mother) (child ?brother)) 
   => 
(assert(brother-of(brother ?brother)(sibling ?person))))
CLIPS> (defrule grandfather-of 
   (or (male (person ?person)) 
       (female (person ?person))) 
   (father-of (father ?grandfather) (child ?person)) 
   (father-of (father ?person) (child ?grandchild)) 
   => 
(assert(grandfather-of(grandfather ?grandfather)(grandchild ?grandchild))))
CLIPS> (defrule grandmother-of 
   (or (male (person ?person)) 
       (female (person ?person))) 
   (mother-of (mother ?grandmother) (child ?person)) 
   (mother-of (mother ?person) (child ?grandchild)) 
   => 
(assert(grandmother-of(grandmother ?grandmother)(grandchild ?grandchild))))
CLIPS> (defrule wife-of 
(male (person ?person)) 
(father-of(father ?person)(child ?child)) 
(mother-of(mother ?wife)(child ?child)) 
   => 
(assert(wife-of(wife ?wife)(husband ?person))))
CLIPS> (defrule husband-of 
(female (person ?person)) 
(father-of(father ?husband)(child ?child)) 
(mother-of(mother ?person)(child ?child)) 
   => 
(assert(husband-of(husband ?husband)(wife ?person))))
CLIPS> (defrule uncle-of 
(or(male (person ?person)) 
(female (person ?person))) 
(father-of(father ?father)(child ?person)) 
(brother-of(brother ?uncle)(sibling ?father)) 
(mother-of(mother ?mother)(child ?person)) 
(brother-of(brother ?uncle)(sibling ?mother)) 
=> 
(assert(uncle ?uncle)(nephew-or-niece ?person)))
CLIPS> (defrule aunt-of 
(or(male (person ?person)) 
(female (person ?person))) 
(father-of(father ?father)(child ?person)) 
(sister-of(sister ?aunt)(sibling ?father)) 
(mother-of(mother ?mother)(child ?person)) 
(sister-of(sister ?aunt)(sibling ?mother)) 
=> 
(assert(aunt ?aunt)(nephew-or-niece ?person)))
CLIPS> (run)
CLIPS> 
