import tutorial

predicate isSouthern(Person p) {
    p.getLocation() = "south"
}

from Person p
where isSouthern(p)
select p