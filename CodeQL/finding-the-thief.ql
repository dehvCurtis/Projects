import tutorial

from Person t

// person is taller than 150cm
where t.getHeight() > 150 

// hair color is not blond
	and not t.getHairColor() = "blond" 

// is not bald
	and exists(string c | t.getHairColor() = c)

// not younger than 30
	and not t.getAge() > 30

// lives in east
	and t.getLocation() = "east"

// has black or brown hair
	and t.getHairColor() = "black" or t.getHairColor() = "brown"

// not taller than 180 & not shorter than 190
	and not t.getHeight() < 190 and t.getHeight() > 180

// no oldest in village


select t