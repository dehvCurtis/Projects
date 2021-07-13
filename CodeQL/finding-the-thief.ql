import tutorial

from Person t

// person is taller than 150cm
where t.getHeight() > 150 

// hair color is not blond
	and not t.getHairColor() = "blond" 

// is not bald
	and exists(string c | t.getHairColor() = c)

// not younger than 30
	and not t.getAge() < 30

// lives in east
	and t.getLocation() = "east"

// has black or brown hair
	and t.getHairColor() = "black" or t.getHairColor() = "brown"

// not taller than 180 & not shorter than 190
	and not t.getHeight() < 190 and t.getHeight() > 180

// not oldest in village
and exists(Person p | p.getAge() > t.getAge())

//  not tallest in village
	and not t = max(Person p | | p order by p.getHeight())

// shorter than avg villager
	and t.getHeight() < avg(float i | exists(Person p | p.getHeight() = i) | i)

// oldest person in east
	and t = max(Person p | p.getLocation() = "east" | p order by p.getAge())

select t