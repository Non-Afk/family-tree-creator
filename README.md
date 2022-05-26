# family-tree-creator
<br>
    Create a complete family tree with limited family information.<br>
    First, input all the information of all peoples. Include their gender and who is the father, mother, and child. Then, I use rules to ask CLIPS to think who the grandfather, grandmother, grandchildren, wife, husband, aunt, and uncle is.<br>
    To learn who is the sister and brother, I compared their father and mother. If there are two children has the same father and same mother, they are sister or brother.<br>
    To learn who is the grandfather and grandmother, compared one person's child and father or mother. If this person has a father or mother, and a child, his father or mother will become grandfather or grandmother, and his child will become grandchild in the facts .<br>
    To learn who is the uncle or aunt, compared a person's father's and mother's sister and brother. If his or her father or mother has a sister or brother, the rule will tell system who is the uncle or aunt, and who is the nephew or niece.<br>
